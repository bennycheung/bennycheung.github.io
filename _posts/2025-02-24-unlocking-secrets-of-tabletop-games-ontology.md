---
layout: post
title: Unlocking the Secrets of Tabletop Games Ontology
date: 2025-02-24 12:00:00.000000000 -00:00
permalink: unlocking-secrets-of-tabletop-games-ontology
author: Benny Cheung
artwork:
  author: Stable Diffusion
tags:
- Ontology
- Tabletop Games
- Game Design
category: post
comments: true
image: images/unlocking-secrets-of-tabletop-games-ontology/post_cover.jpg
images:
  cover: images/unlocking-secrets-of-tabletop-games-ontology/cover2x.jpg
  header: images/unlocking-secrets-of-tabletop-games-ontology/header.jpg
published: false
---

<!--excerpt.start-->
There's a fascinating concept at play in the world of tabletop games, something akin to a secret language. If you can crack this code, you might start to understand why some games rise to legendary status while others fade into obscurity. This isn't just about memorizing rules or mastering strategies; it's about understanding the **Ontology of Games**.
<!--excerpt.end-->

You might be asking, what exactly is an Ontology? In the simplest terms, it's a structured way of organizing knowledge. Think of it as a map of the game universe, not just listing key terms like "worker placement" or "deck building," but also showing how these terms relate to one another (see Engelstein, Geoffrey, and Isaac Shalev  _Building Blocks of Tabletop Game Design: An Encyclopedia of Mechanisms_  for the full taxonomy of tabletop games) . It's more than a glossary; it's about understanding connections. And those connections, once you see them, allow you to do some pretty cool things.

![Personal Embeddings with Flux Generated Images]({{ site.baseurl }}images/unlocking-secrets-of-tabletop-games-ontology/bennycheung_imagination_post.jpg)

_Figure. _

For instance, when an ontology includes the concept of resource management and links it to mechanics like dice rolling and trading, patterns emerge. You start to see how these elements create different player experiences. It’s like having a blueprint for understanding what makes a game tick.

This approach is not just theoretical. Companies like  [Palantir](https://www.palantir.com/) - built on [ontology-driven business processes](https://www.palantir.com/platforms/foundry/) to organize and analyze vast amounts of data, making connections and predictions that wouldn’t be possible otherwise. With the rise of AI, ontologies have become even more crucial. They provide the structured information that AI systems need to learn and reason. If we want to train an AI to understand tabletop games, we need to give it a solid framework. That's where ontologies come in.

## What is the Ontology of Games?

> An ontology is a formal, explicit specification of a shared conceptualization.

In computing excluding the complexity from philosophical traditions, an ontology is a structured knowledge representation that defines concepts, relationships, and categories within a specific domain, in this case, tabletop games. Essentially, it acts as a _shared vocabulary that enables intelligent information systems to understand and integrate data more effectively_. Unlike traditional databases, ontologies allow for more dynamic and context-aware data management, facilitating interoperability between different applications. Ontologies have been widely used in solving data integration challenges and enhancing artificial intelligence applications, such as question-answering systems, scientific discovery, and automated reasoning, making them a crucial component in modern knowledge-driven technologies.

A comparison between relational databases and ontologies as knowledge bases reveals that, unlike RDBMSs, ontologies (knowledge bases) include the representation of the knowledge explicitly, by having rules included, by using automated reasoning (beyond plain queries) to infer implicit knowledge and detect inconsistencies of the knowledge base, and they usually operate under the Open World Assumption .

This same flexibility can be leveraged in tabletop game design, where intricate systems of rules, mechanics, and player interactions demand a structured yet adaptable framework. By utilizing a simplified tabletop game ontology, designers can systematically dissect and reimagine the core components of gameplay, fostering innovative designs that balance structure, strategy, and player engagement.

### Exploring Tabletop Game Design Through a Simplified Ontology

We know an engaging tabletop game requires a thoughtful balance of structure, strategy, and player interaction. By leveraging a simplified tabletop game ontology, we can break down the essential elements that make a game both effective and enjoyable. This model emphasizes core components - **Game Types**, **Mechanisms**, **Components**, and **Players** - allowing us to focus on how these elements interact to create compelling gameplay experiences.

1. **Game Types** - Basic classification of games (e.g., cooperative, competitive).
2. **Core Mechanics** - Fundamental game mechanisms like turn structure, actions, and resolution.
3. **Game Components** - Physical elements like cards, tokens, and boards.
4. **Players** - Representation of participants and their interactions.

By mapping out how different elements—such as mechanics, components, and player interactions—interrelate, designers can gain valuable insights into what makes gameplay engaging and memorable. A **simplified tabletop game ontology** serves as a structured blueprint, allowing us to systematically analyze and design games by breaking down their core elements.

![Tabletop_Game_Simplified_Ontology]({{ site.baseurl }}images/unlocking-secrets-of-tabletop-games-ontology/Tabletop_Game_Simplified_Ontology.png)

_Figure 1. By applying a simplified tabletop game ontology, we can gain a structured perspective on the domain, allowing us to effectively discuss and analyze popular games throughout this article. This approach highlights the power of using ontology to uncover underlying patterns, deepen our understanding, and compare different tabletop games more systematically._

Through this lens, we can begin to understand not just what makes a game function, but why certain designs resonate with players on a deeper level. The following diagram visually represents these relationships, offering a tangible model for how these concepts are interconnected within the design process.

The following sub-sections review all the essential concepts and relationships in the simplified tabletop game ontology, illustrated in _Figure 1_.

#### Defining the Game Framework

At the heart of every tabletop game is the **Game** entity, which outlines its **goal** and **end condition**. A well-defined goal gives players a clear objective, whether it’s accumulating points, conquering territories, or completing a quest. The end condition specifies when the game concludes—such as reaching a certain score or completing all game rounds—bringing structure and pacing to the experience.

Games can be categorized into types like **BoardGames** and **CardGames**, each bringing unique dynamics. A board game might focus on spatial strategy and movement across a game board, while a card game could emphasize probability, bluffing, or hand management.

#### Crafting Engaging Mechanisms

Mechanisms drive player interaction and strategic depth. The simplified ontology highlights essential mechanics:

- **Turn Structure**: Establishes how and when players act. A structured turn order ensures fairness and rhythm in gameplay.
- **Action**: Determines what players can do during their turns, from placing tokens to drawing cards. Strategic depth arises from offering meaningful choices.
- **Resolution**: Resolves the outcomes of player actions, such as winning a challenge or completing a quest.
- **Uncertainty**: Introduces elements of chance or hidden information, keeping gameplay dynamic and engaging.

For instance, incorporating a turn-based system where players take actions in a set order allows for strategic planning. Adding uncertainty - such as drawing random cards, can create suspense and surprise, enhancing the overall excitement.

#### Building Physical and Conceptual Components

**Components** are the tangible elements that bring the game to life. Boards, cards, and tokens serve as physical representations of the game’s mechanics and narrative. A well-designed board enhances immersion, while custom tokens or unique card designs can add thematic depth and tactile enjoyment.

Players interact with these components, shaping the game’s narrative and flow. The **Player** class emphasizes individual roles, with each player bringing their strategies and decisions to the table. By designing interactions that allow for collaboration, competition, or role-playing, designers can create rich social experiences.

#### Creating an Engaging Game Concept

Consider designing a competitive board game where players act as treasure hunters exploring a mysterious island. The **goal** is to collect the most valuable treasures before the game ends. Players take turns moving across the board (**Turn Structure**), performing actions like digging for treasure or sabotaging opponents (**Action**). Randomly drawn event cards introduce **Uncertainty**, presenting new challenges or rewards.

Resolution mechanisms determine whether an action succeeds—for example, rolling a dice to see if a trap is successfully disarmed (**Resolution**). The game ends when all treasure spaces have been explored (**End Condition**).

## Case Studies: Unveiling Insights Through Ontology

Once constructed, the ontology helps define core concepts such as game structures, mechanics, and player roles. These foundational ideas are then linked to physical and conceptual game elements like dice, cards, boards, and player interaction spaces.

Let's examining specific games through the lens of ontology reveals the intricate mechanics that contribute to their success: (1) Catan and (2) Dune: Imperium. This will help us to understand the utilities of having the ontology as a unified view.

### Applying Tabletop Game Ontology: A Case Study of **Catan**

Using the simplified tabletop game ontology to analyze [Catan](https://boardgamegeek.com/boardgame/13/catan) (1995) reveals how its game design effectively integrates various mechanisms and components to create a dynamic, competitive, and strategic experience. By focusing on the essential elements—game framework, mechanics, components, and player interactions—designers can understand why **Catan** remains a beloved and influential board game in the tabletop gaming community.

![BGG_Catan_Illustration]({{ site.baseurl }}images/unlocking-secrets-of-tabletop-games-ontology/BGG_Catan_Illustration.png)

_Figure. Collect and trade resources to build up the island of Catan in this modern classic. (credit: BoradGameGeek.com [Catan](https://boardgamegeek.com/boardgame/13/catan) (1995))_

#### Visualize in OntoUML

To better understand how the simplified tabletop game ontology can be applied, let’s analyze the popular board game **Catan** (formerly known as *The Settlers of Catan*). This example will illustrate how different elements from the ontology come together to create a rich and engaging gameplay experience.

![Tabletop_Game_Simplified_Ontology_Example_Catan]({{ site.baseurl }}images/unlocking-secrets-of-tabletop-games-ontology/Tabletop_Game_Simplified_Ontology_Example_Catan.png)

_Figure. The simplified tabletop game ontology of Catan, visualized in OntoUML format._

#### Defining the Game Framework

**Catan** is categorized as a **BoardGame** within the ontology. The game’s primary **goal** is to be the first player to reach 10 victory points, which are earned through building settlements, cities, and development cards. The **end condition** is triggered when any player achieves this goal, signaling the end of the game.

The game accommodates 3 to 4 players, each taking on the role of a **Player** competing for dominance through strategy, resource management, and negotiation.

#### Core Mechanisms in Catan

**Catan** integrates several key mechanisms from the ontology that contribute to its depth and replayability:

- **Turn Structure**: The game follows a sequential turn structure. Each player takes their turn in a fixed order, rolling dice, collecting resources, and performing actions like building roads, trading, or buying development cards.
- **Action**: During their turn, players can perform actions such as trading resources with others, constructing roads and settlements, or purchasing development cards. These actions are strategic and force players to plan ahead based on their resources and potential future gains.
- **Resolution**: The outcome of actions is often determined through resource availability. For example, dice rolls dictate which resources are generated, affecting each player's strategy and resource management.
- **Uncertainty**: Dice rolls introduce randomness into the game, simulating resource scarcity and unpredictability. Hidden development cards also contribute to uncertainty, as players cannot be sure what advantages their opponents might hold.

#### Components in Catan

The tangible elements of **Catan** align with the **Component** class in the ontology:

- **Board**: A modular hexagonal board that represents the island of Catan, with each hexagon producing different resources (wood, brick, wheat, sheep, and ore).
- **Cards**: Resource and development cards that players collect and use strategically.
- **Tokens**: Settlement, city, and road tokens represent players’ progress on the board.

These physical components bring the game to life, creating a visually engaging and interactive environment that enhances the strategic gameplay.

#### Player Interaction and Strategy

In **Catan**, each player actively engages with others through trading and negotiation, making player interaction a central component of the game’s enjoyment. Players must balance competition with cooperation—trading can benefit both parties, but too much assistance may empower rivals.

Strategic thinking is essential, as players must decide where to build, which resources to prioritize, and when to block opponents using the robber mechanic. The combination of strategy, negotiation, and luck makes **Catan** a prime example of an engaging and balanced tabletop game.


### Applying Tabletop Game Ontology: A Case Study of **Dune: Imperium**

Using the simplified tabletop game ontology to analyze  [Dune: Imperium](https://boardgamegeek.com/boardgame/316554/dune-imperium) (2020) reveals how its game design intricately weaves together strategic mechanics, thematic components, and dynamic player interaction. By focusing on these essential elements—game framework, mechanics, components, and player engagement—designers can understand why **Dune: Imperium** offers a deeply immersive and strategically rewarding board game experience.

![BGG_Dune_Imperium_Illustration]({{ site.baseurl }}images/unlocking-secrets-of-tabletop-games-ontology/BGG_Dune_Imperium_Illustration.png)

_Figure. Influence, intrigue, and combat in the universe of Dune (credit: BoradGameGeek.com [Dune: Imperium](https://boardgamegeek.com/boardgame/316554/dune-imperium) (2020))_

To better understand how the simplified tabletop game ontology can be applied, let’s analyze the popular board game **Dune: Imperium**. This example will illustrate how different elements from the ontology come together to create a strategic and thematic gameplay experience based on the Dune universe.

#### Visualize in OntoUML

To further illustrate how the simplified tabletop game ontology can be applied, let’s analyze another popular board game **Dune: Imperium**.

![Tabletop_Game_Simplified_Ontology_Example_Dune]({{ site.baseurl }}images/unlocking-secrets-of-tabletop-games-ontology/Tabletop_Game_Simplified_Ontology_Example_Dune.png)

_Figure. The simplified tabletop game ontology of Dune:Imperium, visualized in OntoUML format._

#### Defining the Game Framework

**Dune: Imperium** is categorized as a **BoardGame** within the ontology. The game’s primary **goal** is to accumulate the most victory points through influence, combat, and strategic resource management. Players gain points by controlling key areas, winning conflicts, building alliances, and accumulating resources. The **end condition** is triggered when a player reaches 10 victory points or when the conflict deck is exhausted, signaling the final round of the game.

The game accommodates 1 to 4 players, each taking on the role of a unique **Player** representing a faction leader from the Dune universe. Each leader possesses special abilities that influence their strategies and interactions.

#### Core Mechanisms in Dune: Imperium

**Dune: Imperium** integrates several key mechanisms from the ontology that contribute to its depth and replayability:

- **Turn Structure**: The game uses a sequential turn order where players take actions in rounds. Each round consists of a player taking turns to send agents to locations, followed by a reveal phase and conflict resolution.
- **Action**: Players perform actions by playing cards from their hand to deploy agents on various board spaces, securing resources, advancing influence, or preparing for combat. Strategic card play and resource management are critical for success.
- **Resolution**: Conflict is resolved through a battle mechanic, where players compete for rewards by committing troops and resources. The outcome depends on the number of troops deployed and bonuses from cards, making combat a high-stakes aspect of gameplay.
- **Uncertainty**: The deck-building element introduces uncertainty as players build and shuffle their decks, leading to unpredictable draws each round. Additionally, the outcome of conflicts can be influenced by hidden intrigue cards, adding layers of surprise and strategy.

#### Components in Dune: Imperium

The physical and conceptual components of **Dune: Imperium** align with the **Component** class in the ontology:

- **Board**: Represents key locations on Arrakis, where players deploy agents to gain resources, influence factions, and prepare for conflicts.
- **Cards**: Deck-building cards represent actions, characters, and events, providing players with new abilities and strategies.
- **Tokens**: Troop and agent tokens represent military power and influence, essential for resolving conflicts and securing board spaces.

These components are thematically rich, immersing players in the political and strategic dynamics of the Dune universe.

#### Player Interaction and Strategy

Player interaction in **Dune: Imperium** is intense and multifaceted. Players compete for board spaces, influence faction tracks, and engage in direct conflict. The game encourages strategic blocking, negotiation, and careful planning.

Each player must balance deck-building with board control and resource management. The timing of conflicts and card reveals adds tension and depth, making every decision impactful. Alliances with factions such as the Spacing Guild or Bene Gesserit offer powerful bonuses, encouraging diverse strategies.

### Using Ontology for Game Design

For game designers, ontologies offer a framework for making intentional design choices. They provide clarity in understanding how mechanics interconnect and influence player experience. This framework allows designers to:

- **Make Intentional Choices:** Design with clear goals, ensuring every mechanic supports the desired player experience.
- **Draw Inspiration:** Use existing game frameworks to identify elements that fit the designer’s creative vision.
- **Create Engaging Loops:** Develop gameplay systems that balance short-term rewards with long-term strategies.
- **Identify Potential Pitfalls:** Spot flaws in balance, mechanics, or interaction during the conceptual phase, avoiding costly errors during prototyping.
- **Combine Elements Creatively:** Fuse different mechanics in innovative ways to create fresh, engaging experiences.

## Concluding Remarks

In the world of tabletop games, though, ontologies unlock the secret language of play, helping both players and creators grasp the deeper mechanics that make games memorable. The beauty of ontologies is that they're constantly evolving as new games emerge and new design principles are discovered. They're a living, breathing tool that empowers us to understand, analyze, and create ever more amazing games.

But the concept of an ontology can be applied to so many other areas of life. Imagine an ontology for business, for music, for storytelling, for building relationships. What possibilities do you see? How can this framework help us understand and navigate the complexities of the world around us?

As you dive into your next game night, perhaps you’ll start to notice the hidden patterns and connections that make your favorite games truly shine. Happy gaming!

## References

### Understanding Board Games

- [BGG - Board Game Geek](https://boardgamegeek.com/)
    - The **BoardGameGeek.com** website is a resource that contains a massive game database. It features images and rulebooks that can assist in further inquiry about the games. The website is mentioned as a good resource for learning more about the examples of game mechanisms that are included in the sources.

* Engelstein, Geoffrey, and Isaac Shalev. _Building Blocks of Tabletop Game Design: An Encyclopedia of Mechanisms_. Vol. 1. CRC Press / Taylor & Francis Group, 2020.
    - The key themes, concepts, and mechanisms discussed in the provided excerpts from Geoffrey Engelstein's "Building Blocks of Tabletop Game Design." The book aims to provide a comprehensive exploration of the various elements that comprise tabletop game design, offering a detailed look at individual mechanisms and how they interact within a game. It emphasizes the wide array of possibilities and complexities within game design, and does not present itself as a magic bullet for creating successful games.

### Understanding Ontology Development

- Natalya F. Noy and Deborah L. McGuinness, [Ontology Development 101: A Guide to Creating Your First Ontology](https://protege.stanford.edu/publications/ontology_development/ontology101.pdf), Stanford University.
    - This guide from Stanford University provides a practical introduction to ontology development, focusing on creating formal, explicit descriptions of concepts and their relationships within a specific domain. It details a step-by-step methodology, emphasizing iterative refinement and reuse of existing ontologies. The guide covers key aspects such as defining classes and hierarchies, specifying properties (slots), and establishing constraints (facets). It also addresses naming conventions and the crucial decision-making process involved in balancing the level of detail and granularity in the ontology. The authors illustrate these concepts using a wine and food ontology example, highlighting best practices and potential pitfalls.

- Shaimaa Haridy, et al., [An Ontology Development Methodology Based on Ontology-Driven Conceptual Modeling and Natural Language Processing: Tourism Case Study](https://www.mdpi.com/2504-2289/7/2/101?type=check_update&version=1), _Big Data Cogn. Comput._ **2023**, _7_(2), 101; [https://doi.org/10.3390/bdcc7020101](https://doi.org/10.3390/bdcc7020101)
    - Ontologies provide a powerful method for representing, reusing, and sharing domain knowledge. They are extensively used in a wide range of disciplines, including artificial intelligence, knowledge engineering, biomedical informatics, and many more. For several reasons, developing domain ontologies is a challenging task. One of these reasons is that it is a complicated and time-consuming process. Multiple ontology development methodologies have already been proposed. However, there is room for improvement in terms of covering more activities during development (such as enrichment) and enhancing others (such as conceptualization). In this research, an enhanced ontology development methodology (ON-ODM) is proposed. Ontology-driven conceptual modeling (ODCM) and natural language processing (NLP) serve as the foundation of the proposed methodology. ODCM is defined as the utilization of ontological ideas from various areas to build engineering artifacts that improve conceptual modeling. NLP refers to the scientific discipline that employs computer techniques to analyze human language. The proposed ON-ODM is applied to build a tourism ontology that will be beneficial for a variety of applications, including e-tourism. The produced ontology is evaluated based on competency questions (CQs) and quality metrics. It is verified that the ontology answers SPARQL queries covering all CQ groups specified by domain experts. Quality metrics are used to compare the produced ontology with four existing tourism ontologies. For instance, according to the metrics related to conciseness, the produced ontology received a first place ranking when compared to the others, whereas it received a second place ranking regarding understandability. These results show that utilizing ODCM and NLP could facilitate and improve the development process, respectively.

### Ontology Research for Tabletop Games

- Joshua Kritz and Geraldo Xexéo, [A Vocabulary of Board Game Dynamics](https://arxiv.org/pdf/2403.10267v1), [arXiv:2403.10267](https://arxiv.org/abs/2403.10267) [cs.SE], 15 Mar 2024. 
    - In recent years, significant advances have been made in the field of game research. However, there has been a noticeable dearth of scholarly research focused on the domain of dynamics, despite the widespread recognition among researchers of its existence and importance. The objective of this paper is to address this research gap by presenting a vocabulary dedicated to boardgame dynamics. To achieve this goal, we employ a focus group to generate a set of dynamic concepts that are subsequently subjected to validation and refinement through a survey. The resulting concepts are then organized into a vocabulary using a taxonomic structure, allowing the grouping of these concepts into broader and more general ideas.

- J. Kritz, E. Mangeli, G. Xexéo, [Building an Ontology of Boardgame Mechanics based on the BoardGameGeek Database and the MDA Framework](https://www.semanticscholar.org/paper/Building-an-Ontology-of-Boardgame-Mechanics-based-Kritz-Mangeli/373c770ab468bb06b29030c34427eafae399cc42), 2017. 
    - This work intends to build a Game Mechanics Ontology based on the mechanics category presented in BoardGameGeek.com vis à vis the formal concepts from the MDA framework. The 51 concepts presented in BoardGameGeek (BGG) as game mechanics are analyzed and arranged in a systemic way in order to build a domain sub-ontology in which the root concept is the mechanics as defined in MDA. The relations between the terms were built from its available descriptions as well as from the authors’ previous experiences. Our purpose is to show that a set of terms commonly accepted by players can lead us to better understand how players perceive the games components that are closer to the designer. The ontology proposed in this paper is not exhaustive. The intent of this work is to supply a tool to game designers, scholars, and others that see game artifacts as study objects or are interested in creating games. However, although it can be used as a starting point for games construction or study, the proposed Game Mechanics Ontology should be seen as the seed of a domain ontology encompassing game mechanics in general.


