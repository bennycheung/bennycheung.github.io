---
layout: post
title: Game Architecture for Card AI (Part 1)
date: 2021-06-27 12:00:00.000000000 -00:00
permalink: game-architecture-card-ai-1
author: Benny Cheung
artwork:
  author: Thomas Lehmann - Race for the Galaxy Cards
tags:
- Game Architecture
- Card Game
- Python
- AI
category: post
comments: true
image: images/game-architecture-card-ai-1/cover2x.jpg
images:
  cover: images/game-architecture-card-ai-1/cover.jpg
  header: images/game-architecture-card-ai-1/header.jpg
published: true
---
<!--excerpt.start-->
Being software architects, we always interest to know how a software system is built.
At the same time, if one is a gamer, you would meditate on how a game is being designed and constructed;
especially, when you are toasted by the card game's AI that makes you "angry".
Such an emotional response is pushing forward positively, becomes the driving force for a personal month-long investigation into studying the game architecture and how to construct a game. Consequently, I can study the smart AI that gets me kicked.
<!--excerpt.end-->

## <a name="RFTG"></a> Card Game - Race for the Galaxy
The card game in focus is [Race for the Galaxy](https://boardgamegeek.com/boardgame/28143/race-galaxy) (RFTG). For reader convenience, I quoted from the official game description here:

> In the card game Race for the Galaxy, players build galactic civilizations by playing game cards in front of them that represent worlds or technical and social developments. Some worlds allow players to produce goods, which can be consumed later to gain either card draws or victory points when the appropriate technologies are available to them. These are mainly provided by the developments and worlds that are not able to produce, but the fancier production worlds also give these bonuses.
>
> At the beginning of each round, players each select, secretly and simultaneously, one of the seven roles which correspond to the phases in which the round progresses. By selecting a role, players activate that phase for this round, giving each player the opportunity to perform that phase's action. For example, if one player chooses the settle role, each player has the opportunity to settle one of the planets from their hand. The player who has chosen the role, however, gets a bonus that applies only to them. But bonuses may also be acquired through developments, so you must be aware when another player also takes advantage of your choice of role.

### Game AI and Source Code
We are fortunate that Keldon Jones, who is the AI developer of the card game, described in his [post](https://boardgamegeek.com/thread/438698/article/3878167?fbclid=IwAR1KXYI1li66vhPBPwzwNfr8Tvg2Giz5zN5eXpVaugtCQe8DLUbILjzBMUE#3878167) how the game AI is being designed. Even though this is back in 2009, it was using neural networks and reinforcement learning to train the game AI. The game AI [source code, written in C,](https://github.com/bnordli/rftg) is released under the GNU General Public License, version 2 (GPLv2). This is an excellent opportunity to learn how the game and the game's AI are developed. In the process, the game is rewritten in Python for my better understanding so that I can run and visualize experiments with the AI code more conveniently.

![Race for the Galaxy Python]({{ site.baseurl }}images/game-architecture-card-ai-1/RFTG_Cocos_Python_12fps.gif)
*Figure. Showing the card game is designed and rewritten in Python. The game UI and animation are done using Cocos2d - Python edition. (credits: Rio Grande Games holds the copyrights for the images)*

This article starts with the general game architecture to identify the important components of a game. The architecture will provide a layout of how to read a game source code. Then we shall show how to analyze and design Keldon's RFTG C code, such that we can rewrite the game components in an object-oriented Python code.

In part 1, we shall lay out the groundwork by describing a game architecture. Since the architecture components are numerous, this article will focus only on the RFTG's (1) Game Model and (2) Game Assets. As always, a balance between theory and practice, we set up the Python development to illustrate the object-oriented conversion process of the game. These are the necessary groundwork to support the game engine. The game AI will need to wait for later articles.

* [Game Architecture](#GameArchitecture)
  * [Game Architecture Overview](#GameArchitectureOverview)
* [RFTG Game Model](#GameModel)
* [RFTG Game Assets](#GameAssets)
* [RFTG Python Development](#PythonDevelopment)
  * [Jupyter Notebook Experiments](#Notebook)
  * [Enum](#Enum)
  * [Class](#Class)
  * [Loading Library](#LoadingLibrary)
    * [Inspect Card Designs](#InspectCardDesigns)
    * [Plot Cards](#PlotCards)
  * [Player](#Player)
  * [Game Resource](#GameResource)
  * [Game](#Game)
* [Concluding Remarks](#Conclusion)
* [References](#References)

## <a name="GameArchitecture"></a> Game Architecture
A game is an information system that keeping track of the states in a *game universe*, such that the player(s), both human or AI, can interact with the game through a series of legal actions according to the game rules. The following is a succulent definition of a computer game that is memorable,

> Computer Game is a simulator of the subject of interest. The Game Engine is just a real-time database with a pretty front end and definite rules.

![Game Architecture in the Nutshell]({{ site.baseurl }}images/game-architecture-card-ai-1/Game_Architecture_In_a_Nutshell.png)
*Figure. Game Architecture in the Nutshell*

This is a great start for studying game architecture. The definition layouts the foundational components that a computer game engine must design and implement. This definition is just to set the stage for a more detailed description next.

### <a name="GameArchitectureOverview"></a> Game Architecture Overview
Although the success of a game is not determined by the architecture alone - gameplay does, I cannot emphasize enough that the reasons to have a good architecture. Most importantly, the architecture will clarify the various game components' roles that must be cooperatively decided and designed. Lacking architectural clarity will make the game brittle; subsequently, hurting the game's construction and extension.

![Game Architecture Overview]({{ site.baseurl }}images/game-architecture-card-ai-1/Game_Architecture_Part1.png)
*Figure. Game Architecture Overview - The components are grouped according to their functional roles in the system. The functional roles are (1) Game Story and Game Asset, (2) Game Model, (3) Game Engine, (4) Game Interface, (5) Game AI, (6) Game Physics (only for physics based game), and (7) Hardware Abstraction.  When studying any game source code, this architecture will help to classify their functional roles*

The game architecture is a combination of these great books on:
* game architecture [[RollingsMorris04]](#RollingsMorris04)
* game AI [[MillingtonFung06]](#MillingtonFung06)
* game animation and graphics framework using Cocos2d [[Englbert13]](#Englbert13)

If you are familiar with game development, you will immediately recognize and understand many of these components. Possibly, you may not think of them in terms of architecture. This article will not pretend to be a textbook describing all of these components. But it will provide a board stroke to show their usage with the game architecture.

1. **Game Model** - the information system of a game. The exposition of the game states will be the game model. It shows the relationship between game objects and their operations that can change the game states.
2. **Game Story** and **Game Asset** - the essence of a game. This group of components outlines the game's background story to make the players more engaging. The game universe is collecting player(s) states and the game rules governing legal operations on the game states. The game assets is a general term to include the graphics of game characters, tiles, cards or tokens. The game states are projected into the game assets for the display.
3. **Game Engine** - the rules and rendering of a game. The game states and operations are projected on a display. All legal operations are checked and animated on-screen.
4. **Game Interface** - the management system of a game. The game preference and setup are an integral part of running a game. The interface allows the player(s) to select optional elements of the game. All legal operations are presented and interacted with the player(s) according to the game rules.
5. **Game AI** - the brain of a game. An automated computer agent, encoded in a form of AI, drives the automated agent to perform an intelligent choice of operations. Usually, the AI will be encoded in a way to win a game with respecting all the game rules.
6. **Game Physics** (only for a physics-based game) - the physics of a game world. This component only needed when the game objects and animation must respect the rules of physics, e.g. gravity will make things fall to the ground or an agent cannot walk through a wall. This component is working closely with the game engine to produce believable animation according to physics.
7. **Hardware Abstraction** - the deployment of a game. The game must be able to run on a different platform with a variety of graphics capabilities. The hardware is abstracted so that a game can be coded once and able to run on many platforms, e.g. mobile or PC.

In this article (Part 1), we shall focus on the first 2 components (1) *Game Model* and (2) *Game Assets*.

## <a name="GameModel"></a> RFTG Game Model
Following the game architecture layout in the previous section, the first task to understand a game is its model - how the game information system is organized.

By studying the main data structure described in `rftg.h`, even though it is written in C, the data model is, analyzed, extracted and re-designed as the following class diagram.

![Data Model]({{ site.baseurl }}images/game-architecture-card-ai-1/RFTG_Game_Model.png)

Since the enums are providing a wide range of game vocab in the design, we layout the enums along with their consumer classes in the following class diagram.

The unlinked Phase[1-5] enums are used by AI to describe what is the action being taken in that phase.

![Data Model with Enum]({{ site.baseurl }}images/game-architecture-card-ai-1/RFTG_Data_Model_Enum.png)

These enums and objects are converted to Python for development.
The highest priority is to load the assets - the cards design and image into the system.

## <a name="GameAssets"></a> RFTG Game Assets
The card game assets are usually coming from 2 main sources, (1) Card Designs and (2) Card Images (see Legal Notice for the RFTG card images). Depends on the card design complexity, player holds onto a card or the cards are currently on the table will drive the game logic. A game engine will constantly check for legal actions for a player turn. The card image is simply a graphical representation of a card design. An attractive or meaningful graphics will drive the game immersive story telling, and make the players understand the game states visually.

> Legal Notice: Rio Grande Games holds the copyrights for the images. Permission to distribute the card and goal images has been granted by Rio Grande Games in the source code. But the image files may not be unpacked or redistributed without this notice, or used for any other purpose.

### <a name="CardDesign"></a> Card Design
The card design is specified in `cards.txt` file. We must be able to load and represent the information.
The file format is designed by each line is a command, driven by a single character code as following,

| Code | Description | Details |
|------|-------------|---------|
| # | Comment | comment line
| N | New card | card name
| T | Card type | type, cost, and value 
| E | Expansion counts | expansion the card appears
| G | Good type | good type
| F | Flags | list of (flag)
| P | Power | list of (phase, power name)
| V | VP bonus | list of (VP bonus, bonus type, VP name)

For example, the card designs are (Type 1) is world, and (Type 2) is development. RFTG card design is relatively complex comparing with a normal card, where it only determined by a number and suite (#-Ace of suite-Heart), each RFTG card is designed with a number of attributes applicable to many phases in the game.

#### Type 1 (World) Examples

For example of Type 1 (World) card, the "New Vinland" is designed to be,
* `N` code of `name` is "New Vinland"
* `T` code of `type` 1 (World) of `cost` 2 and `value (vp)` 1
* `E` code of `expansion` 0 and `repeat` 1
* `G` code of `good type` of NOVELTY
* `P` code of power applicable in `phase` 4 that `consume` good type of CONSUME_ANY to GET_2_CARD of 1 and 1
* `P` code of power applicable in `phase` 5 that `produce` good type of the world

<img src="{{ site.baseurl }}images/game-architecture-card-ai-1/RFTG_Card_Design_New_Vinland.png" width="500" />

#### Type 2 (Development) Examples
For example of Type 2 (Development) card, the "Replicant Robots" is designed to be,
* `N` code of `name` is "Replicant Robots"
* `T` code of `type` 2 (Development) of `cost` 4 and `value (vp)` 2
* `E` code of `expansion` 0 and `repeat` 2 (i.e. 2 cards in a deck)
* `P` code of power applicable in `phase` 3 that `settle` world by REDUCE of 2 cost

<img src="{{ site.baseurl }}images/game-architecture-card-ai-1/RFTG_Card_Design_Replicant_Robots.png" width="500" />

This is not a complete tutorial on all the RFTG card's design possbility here but to serve as illustration of how RFTG card design complexity that contribute to the strategic nature. Subsequently, the game complexity will make the game AI more interesting to develop, to train and to execute.

## <a name="PythonDevelopment"></a> RFTG Python Development
Interest reader can find the full development set up instruction, Python source code and Jupyter notebook experiments described in this article from [[Cheung21]](#Cheung21).

### <a name="Notebook"></a> Jupyter Notebook Experiments
The development experiments are recorded in the Jupyter Notebook `rftg_cards.ipynb` to quickly run the code samples.
Inside Visual Studio code, install the Microsoft's "Jupyter" extension. When activate the `rftg_cards.ipynb` inside VScode, change the Python kernel to use `rftg` that has been setup in the previous steps.

![Running VSCode Jupyter Notebook]({{ site.baseurl }}images/game-architecture-card-ai-1/RFTG_VScode_Jupyter_Notebook-annotated.png)

### <a name="Enums"></a> Enums
The `rftg/enums.py` implements all the enum definitions, for example `CardType` as following

```python
class CardType(Enum):
  WORLD        = 1
  DEVELOPMENT  = 2
```

For more complex enum, e.g. `PhasePower`, is model as a tuple value.

```python
class PhasePower(Enum):
  P1_DRAW               = (1,0)
  P1_KEEP               = (1,1)
  P1_DISCARD_ANY        = (1,2)
  P1_DISCARD_PRESTIGE   = (1,3)
  P1_ORB_MOVEMENT       = (1,4)
  P1_PER_REBEL_MILITARY = (1,5)
  ...
```

Using enum, there are plenty of advantages as such IDE support, type checking and serialization.

```python
from rftg.enums import PhasePower

# get the enum value
(phase, type) = PhasePower.P4_CONSUME_3_DIFF.value

# match the enum by name
code = PhasePower['P4_CONSUME_3_DIFF']
```

Using with IDE, the intellisense will help to show all possible enum values.

![Developing with Enum in IDE]({{ site.baseurl }}images/game-architecture-card-ai-1/Develop_with_Enums.png)

### <a name="Class"></a> Class
The `rftg/cards.py` implements all the class definitions, for example class `Power` as following

```python
from marshmallow import Schema, fields, post_load
from marshmallow_enum import EnumField

class Power:

  class Serializer(Schema):
    phase = fields.Integer()
    code = EnumField(PhasePower)
    value = fields.Integer()
    times = fields.Integer()

    @post_load
    def make_self(self, data, **kwargs):
      return Power(**data)

  serializer = Serializer()

  @staticmethod
  def from_json(json):
    return Power.serializer.load(json)

  def __init__(self, **kwargs):
    # lazy way to take all the keyword parameters
    self.__dict__.update(kwargs)

  def __repr__(self):
    return '<Power {}/{}>'.format(self.phase, self.code)

  def __str__(self):
    return self.__class__.__name__ + ':' + str(vars(self))

  def to_json(self):
    return Power.serializer.dump(self)
```

The class is using `marshmallow` to support serialization schema, such that loading and dumping JSON can be easily done.

For example, the following code illustrates how a `Power` instance is serialized to/from JSON.

```python
from rftg.cards import Power

power = Power(phase=1, code=PhasePower.P1_DISCARD_ANY, value=1, times=1)

json = power.to_json()
print(json)

power2 = Power.from_json(json)
print(power2)
```

The output will look like as,

```json
{
  'times': 1,
  'code': 'P1_DISCARD_ANY',
  'phase': 1,
  'value': 1,
  Power: {
    'phase': 1,
    'code': <PhasePower.P1_DISCARD_ANY: (1, 2)>, 'value': 1,
    'times': 1
  }
}
```

### <a name="LoadingLibrary"></a> Loading Library
The `Library` class helps to parse the cards design file `cards.txt`, and create all the `Design` information of the cards. Since we dumped all the card's image into individual PNG file. We can use the `Library` to load all the card's design images.

```python
from rftg.cards import Library

library = Library()
library.read_cards('cards.txt')
library.read_card_images('card_images')

len(library.designs)
```

The total number of card designs will be 280.

#### <a name="InspectCardDesigns"></a> Inspect Card Designs
We can inspect a card `Design` by serializing into JSON, according to the class's `marshmallow` schema specification.

```python
design = library.card_by_name("Old Earth")
design.to_json()
```

```json
{'index': 6,
 'name': 'Old Earth',
 'vp': 2,
 'expansion': {'index': 0, 'count': 1},
 'powers': [{'times': 0, 'code': 'P4_TRADE_ANY', 'value': 1, 'phase': 4},
  {'times': 0, 'code': 'P4_CONSUME_ANY', 'value': 0, 'phase': 4},
  {'times': 2, 'code': 'P4_GET_VP', 'value': 1, 'phase': 4}],
 'cost': 3,
 'good': 'NONE',
 'flags': ['START', 'START_BLUE'],
 'bonuses': [],
 'type': 'WORLD',
 'source': ['N:Old Earth',
  'T:1:3:2',
  'E@0:1',
  'F:START | START_BLUE',
  'P:4:TRADE_ANY:1:0',
  'P:4:CONSUME_ANY | GET_VP:1:2']}
```

#### Plot Card Design
We can visualize a card design by display the original `cards.txt` source, along with the card image. The `CardDisplay` is a utility class that helps to plot. The `plot_single_card` function is plotting a single card. The `save` function will save the output into PNG file.

```python
import random
from rftg.display import Display, CardDisplay

display = Display('card_images', figsize=(16,8))
card_display = CardDisplay(library, display)
design = library.card_by_name("Old Earth")
text = '\n'.join(design.source)
fig, ax = card_display.plot_single_card(design.name, text=text)
card_display.save('RFTG_Card_Design_Old_Earth.png')
card_display.show()
```

The output image will be,

<img src="{{ site.baseurl }}images/game-architecture-card-ai-1/RFTG_Card_Design_Old_Earth.png" width="500" />

### Deck
We can collect a `Deck` by collecting a set of `Card` from the `Library` of the card designs. To identity a specific deck for RFTG, we need to tell what expansion should be included. To start, we will only take the cards from the base game, with `expansion=0`.

```python
from rftg.cards import Deck

deck = Deck(library)
deck.build_deck(0)
```

The deck of the base game will have totally 114 cards (Note: some card design is repeated)

#### <a name="PlotCards"></a> Plot Deck of Cards
We have a convenience `CardDisplay.plot_cards` to help plotting the deck of cards easily. For example, the following will randomly sample 6 cards from deck.

```python
import random
from rftg.display import CardDisplay

samples = random.sample(deck.cards, 6)
fig, ax = card_display.plot_cards(samples, 6)
card_display.save('RFTG_Deck_Card_Samples.png')
card_display.show()
```

![Samples from Deck]({{ site.baseurl }}images/game-architecture-card-ai-1/RFTG_Deck_Card_Samples.png)

The `CardDisplay.plot_cards` function is very flexible, we can get multiple rows if there are more cards. We shall `random.shuffle()` the deck and plot the first 12 cards in 6 columns (i.e. total 2 rows).

```python
random.shuffle(deck.cards)
fig.ax = card_display.plot_cards(deck.cards[0:12], 6)
card_display.save('RFTG_Desk_Card_Samples_2_Rows.png')
card_display.show()
```

![More Samples from Deck]({{ site.baseurl }}images/game-architecture-card-ai-1/RFTG_Desk_Card_Samples_2_Rows.png)

### <a name="Player"></a> Player
The `Player` class keeps the record of an actor action states within a game.

```python
class Player:

  def __init__(self, **kwargs):
    self.name = kwargs.get('name', '')  # Player's name/color
    self.ai = kwargs.get('ai', False)   # Whether the player is played by the AI
    self.actions = []                   # Action(s) chosen
    self.prev_actions = []              # Previous turn action(s)
    self.phase_bonus_used = False       # Player has used phase bonus
    self.start = 0                      # Player's start world
    self.placing = Location.DECK        # Card chosen in Develop or Settle phase
    self.bonus_military = 0             # Bonus military accrued so far this phase
    self.bonus_reduce = 0               # Bonus settle discount accrued so far this phase
    self.end_discard = 0                # Number of cards discarded at end of turn
    self.vp = 0                         # Victory point chips
    self.end_vp = 0                     # Total victory points (if game ended now)
    self.winner = False                 # Player is the winner
    self.drawn_round = 0                # Number of cards drawn this round (or last round)
    self.skip_develop = False           # Player skipped last Develop phase and hasn't drawn new cards
    self.skip_settle = False            # Player skipped last Settle phase and hasn't drawn new cards
    self.low_hand = 0                   # Lowest hand size of turn
    self.table_order = 0                # Counter for cards played
    self.phase_cards = 0                # Cards earned during the current phase
    self.phase_vp = 0                   # VP earned during the current phase
    self.choice_log = []                # Log of player's choice
    self.choice_history = []            # History of player's choice

  def __repr__(self):
    return '<Player {}/{}>'.format(self.name, self.ai)

  def __str__(self):
    return self.__class__.__name__ + ':' + str(vars(self)))
```

### <a name="GameResource"></a> Game Resource
The `GameResource` class keeps the global resources required by a game, such as the `Library` and `CardDisplay`.

```python
class GameResource:

  def __init__(self, **kwargs):
    self.library = kwargs.get('library', None)
    self.display = kwargs.get('display', None)

  def __str__(self):
    return self.__class__.__name__ + ':' + str(vars(self))
```

### <a name="Game"></a> Game
Last but not least, the `Game` class keeps the record of global states of a game.

```python
class Game:

  def __init__(self, **kwargs):
    self.resource = kwargs.get('resource', None)
    self.session_id = kwargs.get('session_id', 0) 
    self.simulation = kwargs.get('simulation', False) # Game is a simulation
    self.debug = kwargs.get('debug', False)           # Whether game is a debug game or not
    self.random_seed = 0                              # Current random seed
    self.start_seed = kwargs.get('start_seed', random.randint(0, 2**16)) # Specify start seed to replay
    self.players = kwargs.get('players', [])
    self.expanded = 0         # Number of expansions in use
    self.promo = False        # Include promo start worlds in deck
    self.vp_pool = 0          # Victory points remaining in the pool
    self.action_selected = [] # Actions selected this round 
    self.cur_action = Phase.ACTION
    self.turn = 0
    self.round = 0
    self.game_over = False

    # random seed
    random.seed(self.start_seed)

    # build game specific deck
    self.deck = Deck(self.resource.library)
    self.deck.build_deck(self.expanded)
  
  def __repr__(self):
    return '<Game {}/{}>'.format(self.session_id, self.start_seed)

  def __str__(self):
    return self.__class__.__name__ + ':' + str(vars(self))  
```

To create a game session, the initialization steps are shown as following.

```python
from rftg.cards import Library, Deck, Card
from rftg.display import Display, CardDisplay
from rftg.game import GameResource, Game, Player

# create the game resources
library = Library()
library.read_cards('cards.txt')
library.read_card_images('card_images')
library.load_actions('card_images')
print('Designs: {}'.format(len(library.designs)))

display = Display('card_images', figsize=(16,8))
card_display = CardDisplay(library, display)

# build the game deck
deck = Deck(library)
deck.build_deck(0)
print('Cards: {}'.format(len(deck.cards)))

# create the players
player1 = Player(name="Blue", ai=False)
player2 = Player(name="Red", ai=False)
players = [player1, player2]

# create a new game with players
rresource = GameResource(library=library, display=display)
game = Game(resource=resource, session_id='testing', deck=deck, players=players)
```

Finally, the RFTG game information model is completed!

## <a name="Conclusion"></a> Concluding Remarks
We need to show respect to the game development community. This is a long road, even only to cover (1) Game Model and (2) Game Assets for a well-designed card game. In the process, we have gained critical insights into a card game information system; even though we are focus on a particular card game RFTG. For an avid reader and experienced developer, the card game model can be generalized and applied to a different type of card game. Looking forward to the next article, we shall continue to explore (3) Game Engine and (4) Game Interface development. These are the pre-requisites before we can develop, train and visualize the (5) game AI in the future.

* **>>** [Game Architecture for AI (Part 1)](http://bennycheung.github.io/game-architecture-card-ai-2)
* [Game Architecture for AI (Part 2)](http://bennycheung.github.io/game-architecture-card-ai-2)
* [Game Architecture for AI (part 3) ... coming soon]()

## <a name="References"></a> References

### Game Architecture
* <a name="RollingsMorris04">[RollingsMorris04]</a> Andrew Rollings & Dave Morris, Game Architecture and Design: A New Edition, 2004, New Rider Publishing, ISBN: 0-7357-1363-4
  * This is not a programming book; it is a design book. Andrew Rollings and Dave Morris do talk about game architecture, and pick apart some top games with state diagrams and sketches of class hierarchies, but that sort of content is in the minority. Mostly, the authors provide informed opinions about bigger engineering decisions.
* <a name="MillingtonFung06">[MillingtonFung06]</a> Ian Millington & John Funge, Artificial Intelligence for Games, 2006, Elsevier, Morgan Kaufmann Pub., ISBN: 978-0-12-497782-2
  * This is a comprehensive reference for all game AI practices, terminology, and know-how. Ian Millington brings extensive professional experience to the problem of improving the quality of AI in games. He describes numerous examples from real games and explores the underlying ideas through detailed case studies.
* <a name="Englbert13">[Englbert13]</a> Roger Engelbert, COCOS2dX by Example, 2013, Packt Pub., ISBN: 978-1-78-216734-1
  * This is a hands-on practical book to build your own cross platform games using all the benefits of a time tested framework of Cocos2d (Cocos2dX is the C++ version). Follow six tutorials for six very different games that leverage the ease of Cocos2d framework and its quick implementation, moving from simple ideas to more advanced topics in game development.
* <a name="Buschmann07">[Buschmann07]</a> Frank Buschmann & Kevlin Henney & Douglas C. Schmidt, Pattern-Oriented Software Architecture: On Patterns and Pattern Languages, 2007, Wiley Pub., ISBN: 978-0-47-148648-0
  * This is an advanced software architecture book on design patterns. The only book to attempt to develop a comprehensive language that integrates patterns from key literature, it also serves as a reference manual for all pattern-oriented software architecture (POSA) patterns.

### Race for the Galaxy
* <a name="Jones09">[[Jones09]](https://boardgamegeek.com/thread/438698/article/3878167?fbclid=IwAR1KXYI1li66vhPBPwzwNfr8Tvg2Giz5zN5eXpVaugtCQe8DLUbILjzBMUE#3878167)</a> Keldon Jones, Talk a bit about how the AI works, Sep 2009
  * Latest Source Code 0.9.5, with all expansions <https://github.com/bnordli/rftg>
* <a name="Tesauro95">[[Tesauro95]](https://bkgm.com/articles/tesauro/tdl.html)</a> Gerald Tesauro, Temporal Difference Learning and TD-Gammon, Communications of the ACM, March 1995 / Vol. 38, No. 3
* <a name="TempleGates17">[[TemplateGates17]](https://www.templegatesgames.com/race-for-the-galaxy-ai/)</a> Race for the Galaxy AI, Temple Gates, Dec 2017
  * Temple Gates is the game developer for the App version that using Keldon Jone's AI engine
* <a name="Cheung21">[[Cheung21]](https://github.com/bennycheung/RaceGalaxyAI-Python)</a> Benny Cheung, Game Architecture for AI (Part 1) - Jupyter Notebook, Jun 2021
