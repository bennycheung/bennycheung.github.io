---
layout: post
title: Game Architecture for Card Game AI (Part 3)
date: 2021-07-02 12:00:00.000000000 -00:00
permalink: game-architecture-card-ai-3
author: Benny Cheung
artwork:
  author: David Cheung - Race for the Galaxy Power
tags:
- Game Architecture
- Card Game
- Python
- AI
category: post
comments: true
image: images/game-architecture-card-ai-3/cover2x.jpg
images:
  cover: images/game-architecture-card-ai-3/cover.jpg
  header: images/game-architecture-card-ai-3/header.jpg
published: true
---
<!--excerpt.start-->
The last article on the topics of "Game Architecture for Card Game" series will focus on the amazing "Race for the Galaxy" AI. Even though Keldon Jones released his RFTG AI source code back in 2009 [[Jones09]](#Jones09), it was using neural networks and reinforcement learning to train the game AI, way before DeepMind's Alpha Go success that drew the world's attention to reinforcement learning.
<!--excerpt.end-->

At the heart of the card game architecture is the AI that keeps the human player engaged and provides the endless replayability of a game. We must provide the AI agent (either a single or a group of players) the ability to make intelligent decisions according to the game rules and logic. The AI action will be the movement that affects the future game states. The reward of the decision is simple, "winning" the target game.

![Game Architecture Overview]({{ site.baseurl }}images/game-architecture-card-ai-3/Game_Architecture_Part3.png)
*Figure. Game Architecture Overview - The components are grouped according to their functional roles in the system. The functional roles are (1) Game Story and Game Asset, (2) Game Model, (3) Game Engine, (4) Game Interface, **(5) Game AI**, (6) Game Physics (only for physics based game), and (7) Hardware Abstraction.  When studying any game source code, this architecture will help to classify their functional roles*

To train a Reinforcement Learning (RL) agent how to play a card game intelligently,
a fully-fledged game environment has been put in place and needs to capture all the mechanics and rules so that the agent can interact with the game like a real human player would do. The hardest part is to develop the game that can play intelligently against itself. With that thought, researches using RL in card games are gaining a lot of popularity, such as the card games of Easy21 [[Amrouche20]](#Amrouche20), UNO [[Pfann21]](#Pfann21). The RLCard Toolkit [[Daochen19]](#Daochen19), goes even one step further by providing a general RL framework for researching card games. In this article, we shall continue focus on "Race for the Galaxy" card game.

However, the RFTG card game's rule complexity is difficult to express in a well-defined game state representation, like Easy21 or UNO, we must raise the level of abstraction in order to describe RFTG AI. Following this outline, we are hoping to guide readers in the right direction.

* [Temporal Difference - Reinforcement Learning](#TDLearning)
  * [Game State](#GameState)
  * [Neural Network](#NeuralNetwork)
    * [Eval Network](#EvalNetwork)
    * [Role Network](#RoleNetwork)
  * [Decisions](#Decisions)
* [Concluding Remarks](#Conclusion)
* [References](#References)

## <a name="TDLearning"></a> Temporal Difference - Reinforcement Learning
Collecting the information provide by both [Keldon's post](#Jones09) and [Temple Gate's blog post](#TempleGates17), we learned that RFTG AI follows [Tesauro's TD-Gammon](#Tesauro95) ideas using Temporal Difference (TD) neural network. And yes, neural network and reinforcement learning techniques are applied to games since the '90s.

One of the biggest attraction of reinforcement learning, it does not require a pre-defined model (aka. model-free) and no human input needed to generate the training data. The neural network learns by repeatedly playing with itself, for instance, RFTG AI was trained iteratively over 30,000 simulated games to find the weights for neural network nodes.
The innovative idea of this learning algorithm consists of updating the weights in its neural net after each turn to reduce the difference between its evaluation of previous turns' board positions, its evaluation of the present turn's board position—hence "temporal-difference learning".

During network training, AI examines on each turn a set of possible legal moves and all their possible responses (via the optimal policy), feeds each resulting game state into its evaluation function, and chooses the action that leads to the player got the highest score. TD's innovation was in how it learned its evaluation function incrementally using reinforcement learning.

After each turn, the learning algorithm updates each weight in the neural net according to the following rule:

$$
w_{t+1} - w_t = \alpha(Y_{t+1} - Y_t)\sum_{k=1}^{t}\lambda^{t-k} \nabla_w Y_k
$$

where:

* $w_{t+1} - w_t$ is the amount to change the weight from its value on the previous turn.
* $Y_{t+1} - Y_t$ is the difference between the current and previous turn's board evaluations.
* $\alpha$ is a "learning rate" parameter.
* $\lambda$ is a parameter that affects how much the present difference in board evaluations should feed back to previous estimates. $\lambda = 0$ makes the program correct only the previous turn's estimate; $\lambda = 1$ makes the program attempt to correct the estimates on all previous turns; and values of $\lambda$ between 0 and 1 specify different rates at which the importance of older estimates should "decay" with time.
* $\nabla_w Y_k$ is the gradient of neural-network output with respect to weights: that is, how much changing the weight affects the output.

For more reinforcement learning, reader can consult the excellent tutorial by Tambet Matiisen [[Matiisen15]](#Matiisen15), DeepMind's RL lectures by David Silver [[Silver17]](Silver17) and the classic RL textbook by Sutton [[Sutton17]](Sutton17).

### <a name="GameState"></a> Game State
The game state can represent any information available to the decision-maker, that is useful to describe the current situation of the game.  This could be the type of cards a player holds, the number of cards the opponent holds, or information regarding cards that have already been played. Without a doubt, RFTG is a complex card game, due to its elaborate set of rules and phases of action.

By reading the list of input node names, we can understand the game states are fed into the network. The game state can be,

* Game over
* VP Pool size
* Max active cards
* Type of cards at hand
* The number of cards at hand
* Player number of goods
* Opponent number of goods
* etc.

The list can go from *700s* for a game of 2 players up to *1,800s* for a game of 5 players (using expansion=6).

### <a name="NeuralNetwork"></a> Neural Networks
These inputs don’t just feed into one neural network. According to Keldon's code, he got twelve unique models of neural networks each trained for a different set of expansions and player count. If we're running a two-player game, the AI is on a different network than a three-player game. For each game model, there are two flavours of neural networks at work, each with its main function.

For example,
* Eval Network - file for `eval` weights for expansion 0 (base game) 2 (players) `rftg.eval.0.2.net`
* Role Network - file for `role` weights for expansion 0 (base game) 2 (players) `rftg.role.0.2.net`

Both network weights file format are the same; the contents are varying with,
* Input size, hidden layer size, output layer size
  * For example `rftg.eval.0.2.net` : (704, 50, 2)
  * For example `rftg.role.0.2.net` : (605, 50, 7)
* Number of training iterations
* The list of input node names
* The weights for each layer nodes

#### <a name="EvalNetwork"></a> Eval Network
The `eval` network output can be thought of each player's chances to win. Each row corresponds to computing the eval network from the point of view of that player because certain things are known only to a given player, such as cards in hand. For example, the following `eval` network is for 2 players, i.e. the output layer has 2 output for each player winning scores.

![RFTG Eval Neural Network]({{ site.baseurl }}images/game-architecture-card-ai-3/RFTG_Eval_NN.png)
*Figure. Showing the fully connected `eval` network layers. (note: not all connections are drawn for less lines). The input layer nodes are the designed game states and the output layer nodes are the winning scores for each player (in this example, 2 nodes for 2 players.*

#### <a name="RoleNetwork"></a> Role Network
There is another important decision is choosing which action at the beginning of each turn. This is handled a bit differently. First, the AI predicts what each opponent is likely to do. This is done with a second `role` network. This network is very similar to the eval network, except that it has an output for each possible 7 types of action choice a player may make.

![RFTG Role Neural Network]({{ site.baseurl }}images/game-architecture-card-ai-3/RFTG_Role_NN.png)

*Figure. Showing the fully connected `role` network layers. (note: not all connections are drawn for less lines). The input layer nodes are the designed game states and the output layer nodes are the 7 types of action choice.*

### <a name="Decisions"></a> Decisions
Using the network is simple, gathering all the required game state as input to the network.
Once the game state is scored by both networks, the scores represent the chance of player winning and the role of action choice, are handled by AI to make a decision for a action.

![RFTG AI Decision]({{ site.baseurl }}images/game-architecture-card-ai-3/RFTG_Game_Model_Decision.png)

*Figure. the abstract superclass `Decisions` functions are overridden by the implementation of `AIDecisions` functions*

As we have examined the `Decision` is an abstract superclass that defines all the decision operations that are implemented as `UIDecision` for human actors and are implemented by `AIDecision` for a computer AI actor. The cards, that the AI agent decides to play, represent the actions it is taking.

## <a name="Conclusion"></a> Concluding Remarks
In this last article, we have explored (5) Game AI in RFTG card games. We can see how reinforcement learning helps to train a neural network that can play by itself. After the neural network is trained, the game AI can decide intelligently and provide endless challenges to a human player. For an avid reader and experienced developer, the temporal difference - reinforcement learning technique can be applied to train other types of card games.

Hope this "Game Architecture for Card Game" series help to inspire better card game design and produce more powerful card game AIs!

* [Game Architecture for Card Game Model (Part 1)](http://bennycheung.github.io/game-architecture-card-ai-1)
* [Game Architecture for Card Game Action (Part 2)](http://bennycheung.github.io/game-architecture-card-ai-2)
* **>>** [Game Architecture for Card Game AI (part 3)](http://bennycheung.github.io/game-architecture-card-ai-3)

## <a name="References"></a> References

### Game AI
* <a name="MillingtonFung06">[MillingtonFung06]</a> Ian Millington & John Funge, Artificial Intelligence for Games, 2006, Elsevier, Morgan Kaufmann Pub., ISBN: 978-0-12-497782-2
  * This is a comprehensive reference for all game AI practices, terminology, and know-how. Ian Millington brings extensive professional experience to the problem of improving the quality of AI in games. He describes numerous examples from real games and explores the underlying ideas through detailed case studies.

### Race for the Galaxy AI
* <a name="Jones09">[[Jones09]](https://boardgamegeek.com/thread/438698/article/3878167?fbclid=IwAR1KXYI1li66vhPBPwzwNfr8Tvg2Giz5zN5eXpVaugtCQe8DLUbILjzBMUE#3878167)</a> Keldon Jones, Talk a bit about how the AI works, Sep 2009
  * Latest Source Code 0.9.5, with all expansions <https://github.com/bnordli/rftg>
* <a name="Tesauro95">[[Tesauro95]](https://bkgm.com/articles/tesauro/tdl.html)</a> Gerald Tesauro, Temporal Difference Learning and TD-Gammon, Communications of the ACM, March 1995 / Vol. 38, No. 3
* <a name="TempleGates17">[[TemplateGates17]](https://www.templegatesgames.com/race-for-the-galaxy-ai/)</a> Race for the Galaxy AI, Temple Gates, Dec 2017
  * Temple Gates is the game developer for the App version that using Keldon Jone's AI engine

### Reinforcement Learning
* <a name="Matiisen15">[[Matiisen15]](https://neuro.cs.ut.ee/demystifying-deep-reinforcement-learning/)</a> Tambet Matiisen, Demystifying Deep Reinforcement Learning, Dec 2015
* <a name="Silver17">[[Silver17]](https://www.youtube.com/watch?v=2pWv7GOvuf0&list=PLzuuYNsE1EZAXYR4FJ75jcJseBmo4KQ9-)</a> David Silver, Reinforcement Learning, a series of 10 youtube video lectures
  * This is valuable if you are new to RL and want to understand the mathematical and philosophical background to Reinforcement Learning.
* <a name="Sutton17">[Sutton17]</a> Richard Sutton and Andrew Barto, Reinforcement Learning: An Introduction, MIT Press, 2017, ISBN:9780262193986
  * This book provides a clear and simple account of the key ideas and algorithms of reinforcement learning. Their discussion ranges from the history of the field's intellectual foundations to the most recent developments and applications.
* <a name="Atienza18">[Atienza18]</a> Rowel Atienza, Advanced Deep Learning with Keras, Packt Publishing, 2018, ISBN:978788629416
  * Chapter 9: Deep Reinforcement Learning


### Reinforcement Learning for Card Game AI
* <a name="Amrouche20">[[Amrouche20]](https://towardsdatascience.com/playing-cards-with-reinforcement-learning-1-3-c2dbabcf1df0)</a> Matyas Amrouche, Playing cards with Reinforcement Learning, May 2020
  * Matyas showed how to think and implement RL for the card game - Easy21.
  * Matyas's Jupyter notebook is very informative and a useful reference <https://github.com/Matyyas/Easy21>
* <a name="Pfann21">[[Pfann21]](https://towardsdatascience.com/tackling-uno-card-game-with-reinforcement-learning-fad2fc19355c)</a> Bernhard Pfann, Tackling the UNO Card Game with Reinforcement Learning, Jan 2021
  * Bernhard's Jupyter notebook and UNO game model <https://github.com/bernhard-pfann/uno-card-game_rl>
* <a name="Daochen19">[[Daochen19]](https://arxiv.org/abs/1910.04376)</a> Daochen Zha, et. al., RLCard: A Toolkit for Reinforcement Learning in Card Games, Oct 2019, AAAI-20 Workshop on Reinforcement Learning in Games
  * RLCard is a toolkit for Reinforcement Learning (RL) in card games. It supports multiple card environments with easy-to-use interfaces for implementing various reinforcement learning and searching algorithms. The goal of RLCard is to bridge reinforcement learning and imperfect information games. 
  * Source code: <https://github.com/datamllab/rlcard>

