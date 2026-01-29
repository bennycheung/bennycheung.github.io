---
layout: post
title: "Generative Ontology: From Game Knowledge to Game Creation"
date: 2026-01-30 12:00:00.000000000 -00:00
permalink: generative-ontology-from-game-knowledge-to-game-creation
author: Benny Cheung
artwork:
  author: Gemini 3 Pro
tags:
- Generative AI
- Ontology
- Game Design
- Tabletop Games
- AI
- Context Engineering
category: post
comments: true
image: images/generative-ontology-from-game-knowledge-to-game-creation/post_cover.jpg
images:
  cover: images/generative-ontology-from-game-knowledge-to-game-creation/cover2x.jpg
  header: images/generative-ontology-from-game-knowledge-to-game-creation/header.jpg
  animated-cover: images/generative-ontology-from-game-knowledge-to-game-creation/animated-cover.webp
published: true
series: "Game Architecture"
series_order: 5
featured: true
featured_order: 1
---

<!--excerpt.start-->
In February 2025, we explored how ontologies reveal the hidden structure of tabletop games. But understanding games is not the same as creating them. What if that same structured knowledge could become a creative engine? This is the promise of Generative Ontology, when knowledge representation learns to imagine.
<!--excerpt.end-->

![Generative Ontology - Grammar of Creation]({{ site.baseurl }}images/generative-ontology-from-game-knowledge-to-game-creation/Generative-Ontology-Grammar_of_Creation_01.png)

_Figure. Structure meets Imagination, the duality at the heart of Generative Ontology._

In [Part 4 of the Game Architecture series]({{ site.baseurl }}unlocking-secrets-of-tabletop-games-ontology) [8], we built an ontology for tabletop games. We learned to decompose CATAN into mechanisms (resource trading, modular board, dice-driven production), components (hex tiles, resource cards, settlements), and player dynamics (competitive, negotiation-heavy, variable player count). The ontology gave us a vocabulary for understanding games, a precise language for analysis.

![Board Game Ontology Examples]({{ site.baseurl }}images/generative-ontology-from-game-knowledge-to-game-creation/Board_Game_Ontology_Examples.jpg)

_Figure. Games like CATAN and Dune: Imperium share a common ontological structure beneath their vastly different themes._

But analysis is not creation.

Understanding the structure of sonnets does not make one a poet. Knowing the rules of chess does not generate new games. Our ontology, for all its precision, remained passive, a tool for describing what already exists, not for imagining what could be.

This article explores what happens when we transform that passive vocabulary into an active grammar. What if the same ontology that helps us *analyze* CATAN could help us *generate* games that CATAN's designers never imagined? What if structured knowledge could learn to create?

We call this synthesis **Generative Ontology**: the practice of encoding domain knowledge as executable schemas that constrain and guide AI generation, transforming static knowledge representation into a creative engine. The ontology becomes not just a description of the domain, but the grammar that enables valid, coherent, novel outputs.

The journey from Part 4 to Part 5 is the journey from map to mapmaker, from understanding the territory to generating new territories that could exist.

---

## From Description to Creation

Our game ontology [4] can tell us that worker placement games typically include action spaces, worker tokens, and blocking mechanisms [3]. It cannot generate a novel worker placement game. **Ontologies describe what is, not what could be.**

Large language models have the opposite problem [6]. Ask an LLM to "design a deck-building game set in a haunted mansion," and it will fluently describe players exploring Ravenshollow Manor, collecting ghost cards, managing a "fear mechanic." It sounds plausible. But what cards exist in the starting deck? How do players acquire new cards? What triggers the end of the game? The LLM has generated the *appearance* of a game design without the *substance*, fluent text that would collapse into confusion if handed to a playtester.

![The Paradox of Creation]({{ site.baseurl }}images/generative-ontology-from-game-knowledge-to-game-creation/Generative-Ontology-Grammar_of_Creation_02.png)

_Figure. Traditional Ontology (The Map) vs Pure LLMs (The Dreamer), understanding the rules of chess does not make you a Grandmaster._

| Approach | Strength | Weakness |
|----------|----------|----------|
| **Traditional Ontology** | Precise, structured, validated | Cannot generate novel outputs |
| **Pure LLM Generation** | Creative, fluent, abundant | Unstructured, invalid, hallucinated |

The insight of Generative Ontology is that these limitations are complementary [5]. What ontology lacks, LLMs provide. What LLMs lack, ontology provides. The synthesis produces outputs that are both creative and valid.

---

## Generative Ontology: The Synthesis

![Defining Generative Ontology]({{ site.baseurl }}images/generative-ontology-from-game-knowledge-to-game-creation/Generative-Ontology-Grammar_of_Creation_03.png)

_Figure. LLM Potential + Ontology Constraints = Valid Game Design, from passive vocabulary to active grammar._

If traditional ontology is a map, Generative Ontology is a map that knows how to build new cities.

> **Generative Ontology** is the practice of encoding domain knowledge as executable schemas that constrain and guide AI generation, transforming static knowledge representation into a creative engine.

Let us unpack this definition. When we built our tabletop game ontology, we created a structured vocabulary: game types, mechanisms, components, player interactions. This vocabulary allowed us to *analyze* CATAN and Dune: Imperium with precision. But analysis is not creation. Our ontology could tell us *what games are*. It could not tell us *what games could be*.

The insight of Generative Ontology is this: the same structure that enables understanding can enable creation. The categories that constrain our analysis become the scaffolding for generation.

### The Grammar of Games

Consider an analogy from language. A poet does not experience grammar as a limitation. Grammar is not what prevents poetry. It is what makes poetry *possible*. Without the structure of syntax, semantics, and form, there would be no sonnets, no haiku, no free verse pushing against convention. The rules are not the enemy of creativity; they are its condition of possibility.

The same principle applies to game design. When we ask an unconstrained LLM to "design a board game about space exploration," we get verbose descriptions that sound plausible but collapse under scrutiny. The AI might describe a "resource management mechanic" without specifying what resources exist, how they flow, or what makes acquiring them interesting. It might mention "victory points" without defining how players earn them or when the game ends. The output is fluent but incoherent, all style, no structure.

Generative Ontology provides the grammar. When we encode our game ontology as a schema, we are not limiting the AI's creativity. We are giving it the structural vocabulary to be creative *coherently*. The schema says: every game must have a goal, an end condition, mechanisms that create player choices, components that instantiate those mechanisms. Within those constraints, infinite games are possible. Without them, no valid game emerges.

| Without Ontology | With Generative Ontology |
|------------------|--------------------------|
| "Players collect resources and build things" | Goal: First to 10 victory points via settlements |
| "There's some kind of trading" | Mechanism: Resource trading with 4:1 bank or negotiated rates |
| "The game ends eventually" | End Condition: When any player reaches 10 VP or development deck exhausts |
| Fluent but vague | Structured and playable |

The grammar does not write the poem. But without grammar, there is no poem to write.

### The Whiteheadian Connection

![The Grammar of Games]({{ site.baseurl }}images/generative-ontology-from-game-knowledge-to-game-creation/Generative-Ontology-Grammar_of_Creation_04.png)

_Figure. Eternal Objects (The Ontology) crystallize into Actual Occasions (The Generation), Whitehead's process philosophy made computational._

For readers familiar with our earlier exploration of [Process Philosophy for AI Agent Design]({{ site.baseurl }}process-philosophy-for-ai-agent-design) [9], Generative Ontology has a natural philosophical grounding in Alfred North Whitehead's metaphysics.

Whitehead distinguished between **eternal objects** and **actual occasions** [1]. Eternal objects are pure forms, patterns, qualities, structures that exist as potentials. They do not exist in isolation; they require instantiation in concrete reality. Actual occasions are the concrete events where eternal objects find expression, the specific, situated, temporal moments where form meets matter.

Our game ontology is a collection of eternal objects: the abstract patterns of worker placement, deck building, area control. These patterns have no reality until they are instantiated in actual games, in CATAN's modular hex board, in Dune: Imperium's faction tracks, in the specific cards and tokens and rules that make each game a playable experience.

Generative Ontology is the process of moving from eternal objects to actual occasions. The ontology provides the forms; the generation produces the instances. Creativity, in Whitehead's view, is precisely this: the novel synthesis of eternal objects into actual occasions that have never existed before [2]. The forms constrain but do not determine. Each generated game is a genuine novelty, a new actual occasion that instantiates familiar patterns in unfamiliar configurations.

This is why Generative Ontology is not merely a technical trick but a philosophically coherent approach to AI creativity. We are not asking the AI to create ex nihilo. We are providing it with the eternal objects, the forms, the grammar, the ontological structure, and asking it to synthesize novel actual occasions. The creativity is real, but it is *structured* creativity. It is creativity that knows what a game is, and therefore can imagine what a game could be.

### The Paradox Resolved

We began with an apparent paradox: how can constraints enable creativity? The answer is now clear. Constraints do not limit the space of possibilities. They *define* it. Without the concept of "mechanism," there is no space of possible mechanisms to explore. Without the category of "end condition," there is no design decision about when games should conclude.

Generative Ontology transforms the passive vocabulary of description into the active grammar of creation. The ontology that once helped us understand CATAN now helps us generate games that CATAN's designers never imagined, games that are nonetheless valid, balanced, and playable, because they speak the same grammatical language.

---

## From Ontology Classes to Generation Schemas

![Ontology as Executable Schema]({{ site.baseurl }}images/generative-ontology-from-game-knowledge-to-game-creation/Generative-Ontology-Grammar_of_Creation_05.png)

_Figure. The schema forces the LLM to output valid structured data matching ontological requirements, acting as self-documentation for the model._

Philosophy illuminates the path; engineering builds the road. The key insight in translating Generative Ontology into practice is surprisingly direct: ontology classes map naturally to schema definitions, and schema definitions become the structured outputs that constrain LLM generation.

### The Transformation Pipeline

Recall our simplified tabletop game ontology from the [previous article]({{ site.baseurl }}unlocking-secrets-of-tabletop-games-ontology) [8]. We defined four core concepts:

1. **Game**, the container with goal and end condition
2. **Mechanism**, turn structure, actions, resolution, uncertainty
3. **Component**, board, cards, tokens
4. **Player**, roles and interactions

Each of these ontology classes becomes a typed schema definition. The ontology categories that once helped us analyze games now become the structural constraints that guide AI generation:

| Ontology Concept | Schema Role | Purpose |
|------------------|-------------|---------|
| Game Types | Constrained enumeration | Limits to valid game modes (cooperative, competitive, semi-cooperative) |
| Mechanisms | Typed list from taxonomy | Ensures only recognized mechanics are referenced |
| Components | Structured nested object | Specifies physical game elements with required fields |
| Goal and End Condition | Required string fields with minimum length | Guarantees playability criteria are never left vague |

### The Ontology-to-Schema Correspondence

Let us visualize how our original ontology diagram maps to the generation schema:

```
ONTOLOGY CLASS                 SCHEMA
─────────────────────────────────────────────
Game                     →     Required fields: goal, end condition, type
Mechanism                →     Typed list from established taxonomy
Component                →     Nested object: board, cards, tokens
Player                   →     Structured: count, interaction mode
```

The correspondence is direct. Every ontology class finds expression in the schema. Every relationship in the ontology (Game *has* Mechanisms, Game *uses* Components) becomes a nested structure. The schema is the ontology made executable.

### From Static to Generative

Here is the crucial transformation. Our original ontology was a tool for *analysis*, we could take CATAN and decompose it into ontology terms. The schema flips this relationship. Now the ontology becomes a tool for *synthesis*. We provide a theme, and the constrained generation produces a complete game that satisfies every ontological requirement.

The schema does not tell the LLM *what* game to create. It tells the LLM *what a game must be* to count as valid. Within those constraints, creativity flourishes. The LLM might generate a cooperative deck-building game about deep-sea exploration, or a competitive area-control game about rival coffee roasters, or a semi-cooperative negotiation game about climate treaties. Each output is different; each output is valid; each output conforms to the grammar of games.

But a schema alone is not enough. A single LLM call, even constrained by our ontology, must simultaneously consider mechanisms, theme, components, balance, and player experience. Human design teams do not work this way.

---

## Specialized Agents for Each Ontology Domain

![Specialized Agents and Their Anxieties]({{ site.baseurl }}images/generative-ontology-from-game-knowledge-to-game-creation/Generative-Ontology-Grammar_of_Creation_08.png)

_Figure. We split the task to create creative tension, preventing shallow, agreeable outputs._

A game designer sketches mechanics while an artist develops visual language while a playtester identifies broken interactions. Each specialist brings focused expertise.

Generative Ontology enables the same division of labor. We decompose the ontology into domains and assign specialized agents to each. The result is not just better output. It is output that benefits from focused attention at every layer.

### The Agent Roster

Our ontology naturally suggests specialization boundaries:

| Agent | Ontology Domain | Expertise | Anxiety |
|-------|-----------------|-----------|---------|
| **Mechanics Architect** | Mechanisms | Turn structure, action economy, resolution systems | "Is there meaningful player agency?" |
| **Theme Weaver** | Narrative | Setting, flavor, thematic integration | "Does the theme feel alive in every mechanism?" |
| **Component Designer** | Components | Cards, tokens, board layout, physical affordances | "Can players physically manipulate this smoothly?" |
| **Balance Critic** | Cross-domain | Interaction analysis, dominant strategy detection | "What breaks? What is unfun when optimized?" |
| **Fun Factor Judge** | Player experience | Engagement loops, tension, satisfaction | "Would I want to play this again?" |

The "Anxiety" column is crucial. Each agent is not merely assigned a domain. It is given a *concern*, a professional worry that shapes its generation and critique. The Mechanics Architect does not just produce mechanisms; it worries about whether those mechanisms create meaningful choices. This anxiety-driven design prevents the "yes-man" tendency of LLMs to produce plausible but shallow output.

### Why Multi-Agent Outperforms Single-Pass

The multi-agent approach offers several advantages:

1. **Focused Expertise**: Each agent optimizes for its domain without distraction. The Mechanics Architect does not worry about card art; the Component Designer does not second-guess mechanism choices.

2. **Built-in Tension**: The agents have different anxieties. The Mechanics Architect wants elegant systems; the Fun Factor Judge wants excitement. This tension mirrors real design team dynamics.

3. **Explicit Handoffs**: Information flows through defined interfaces (the typed schemas). Each agent receives exactly what it needs from previous stages.

4. **Iterative Refinement**: Critics identify issues; refiners address them. The pipeline does not blindly accept first-pass output.

5. **Observability**: We can inspect each agent's contribution. When something goes wrong, we know which agent to adjust.

The multi-agent pipeline transforms Generative Ontology from a single generation event into a collaborative design process, one that mirrors, in structure if not in consciousness, how human teams create games.

But collaboration alone does not guarantee correctness. Agents can still agree on outputs that look valid but are not. We need a final layer of assurance.

---

## Validation and Refinement: Ontology as Contract

![Ontology as Reward Function]({{ site.baseurl }}images/generative-ontology-from-game-knowledge-to-game-creation/Generative-Ontology-Grammar_of_Creation_07.png)

_Figure. The system retries with specific error messages until structural coherence is achieved._

Generation is not enough. LLMs are notoriously agreeable. They will produce output that *looks* valid without ensuring it *is* valid. The ontology serves not only as a generation schema but as a validation function: a set of constraints that generated designs must satisfy to count as coherent.

### The Yes-Man Problem

Consider what happens when we ask an LLM to generate a deck-building game. It might produce a design that mentions "deck building" as a mechanism but includes no cards in the components. This is structurally incoherent. You cannot build a deck without cards. The LLM produced something that *sounds* like a deck-building game without understanding what deck-building *requires*.

Schema validation catches type errors and missing fields. But semantic coherence, the relationship between mechanisms and components, between game type and player interaction, requires deeper validation.

### Ontology as Constraint Checker

We encode ontological constraints as validation rules that check cross-field consistency:

- **Mechanism-Component Coherence**: Deck building requires cards. Area control requires a board. Worker placement requires worker tokens. If a mechanism is declared, the corresponding components must exist.
- **Game Type Consistency**: Cooperative games cannot have direct conflict as their primary interaction mode. Competitive games should not declare cooperative interaction.
- **Playability Requirements**: Goals must be specific (not just "win" or "score points"). End conditions must be defined. Turn structure must be specified. Uncertainty sources must exist for replayability.

### The Refinement Loop

When validation fails, the system does not simply report an error. It retries generation with the specific constraint violations included as feedback. The LLM sees: "Your previous design violated these constraints: deck-building mechanism declared but no cards in components. Please correct this."

For complex validation that benefits from multiple attempts, we implement iterative refinement. Generate, validate, identify issues, refine, validate again. This loop continues until the design passes all ontological constraints or a maximum number of attempts is reached.

### Validation as Contract

This validation architecture treats the ontology as a *contract* between the generation system and the downstream consumer. Just as a function signature guarantees what types are returned, the ontology validation guarantees what *structure* and *coherence* properties the generated design will have.

Downstream consumers, whether human designers reviewing output, automated balancing tools, or game engines that need to instantiate the design, can rely on these guarantees. A deck-building game will have cards. A cooperative game will not have direct conflict. The end condition will be specified. The ontology is no longer just a vocabulary for describing games. It is an executable specification that enforces domain validity at generation time.

---

## Case Study: From Theme to Playable Design

![Case Study: The Input]({{ site.baseurl }}images/generative-ontology-from-game-knowledge-to-game-creation/Generative-Ontology-Grammar_of_Creation_10.png)

_Figure. A unique, organic theme with no direct analog, can the ontology handle the nuance of cooperative dominance?_

Theory is persuasive; demonstration is convincing. Let us trace a complete generation through our Generative Ontology pipeline, from initial theme to playable game design.

### The Input

We provide a theme and constraints:

- **Theme**: "Bioluminescent fungi competing for dominance in a deep cave ecosystem"
- **Constraints**: 2-4 players, medium complexity, cooperative, 60-90 minutes

This theme was chosen deliberately: it is unusual enough that no existing games share its exact combination, forcing the system to synthesize rather than imitate.

### The Design Conversation

![The Design Conversation]({{ site.baseurl }}images/generative-ontology-from-game-knowledge-to-game-creation/Generative-Ontology-Grammar_of_Creation_11.png)

_Figure. Step-by-step: Architect to Weaver to Critic to Refiner, system self-correction through specialized agents._

The **Mechanics Architect** analyzes the theme and identifies that bioluminescent fungi suggest growth, spreading, and light/dark dynamics. "Competing for dominance" could mean area control, but "cave ecosystem" implies environmental pressures affecting everyone. Given the cooperative constraint, players work together against the environment. It selects resource management (spore allocation), area control (territory expansion through cave network), and engine building (specialized fungal structures) as core mechanisms. The turn structure combines simultaneous planning with sequential resolution.

The **Theme Weaver** receives these mechanics and integrates narrative. Spore placement becomes reproductive strategy. Area control becomes nutrient access, not military control. Engine building becomes the development of specialized structures, fruiting bodies, rhizomorphs, symbiotic relationships. The antagonist: a rising water table that floods the cave gradually from below. Growth must stay ahead of the water, creating cooperative tension without player-versus-player conflict. The title emerges: **Mycelium: The Deep**.

The **Component Designer** specifies the physical instantiation: 30 modular hex cave tiles with nutrient types and light levels, event cards (cave conditions), structure cards (engines), fungal growth cubes for each player, spore tokens, flood markers, and glow markers as VP sources. The tiles arrange vertically so the bottom represents deeper cave levels, with the flood track visible on the side.

### The Critic's Eye

The **Balance Critic** identifies three issues. First, runaway leader risk: if one player's strain grows faster in a cooperative game, they dominate decisions. Recommendation: add a network synergy rule where connected strains share benefits, making individual dominance a team asset. Second, flood timing feels arbitrary when driven purely by random event cards. Recommendation: make the flood a predictable escalation (rises every round) with event cards as modifiers, so players can plan around a baseline. Third, engine building might be a trap if structures cost growth. Recommendation: each structure should provide an immediate small benefit plus an ongoing ability.

The refinement agent addresses all moderate-severity issues, and the **Fun Factor Judge** evaluates the refined design at 7/10. Key engagement hooks: "Will we reach the surface in time?" as persistent tension, simultaneous placement creating reveal anticipation, and building structures as tangible achievement. Tension moments come from the visible countdown of rising water, event card reveals, and the painful decision of whether to save endangered colonies or abandon them.

### The Final Design

![Final Output: Mycelium: The Deep]({{ site.baseurl }}images/generative-ontology-from-game-knowledge-to-game-creation/Generative-Ontology-Grammar_of_Creation_12.png)

_Figure. The AI-generated game design: structurally complete, thematically tight, and ready for prototyping. This is not a published game but a complete design produced entirely by the Generative Ontology pipeline. Explore the complete ontology for [Mycelium: The Deep on GameGrammar](https://gamegrammar.dynamindresearch.com/s/04HPtDzsTB5P9r7iTZ4yDKVzzVoCNHvRH0y5hwEDIF0) [11]._

The complete output:

| Field | Value |
|-------|-------|
| **Title** | Mycelium: The Deep |
| **Theme** | Bioluminescent fungi escaping rising floodwaters in an ancient cave |
| **Game Type** | Cooperative |
| **Goal** | Grow the fungal network from the cave depths to the surface before the flood reaches the highest colony |
| **End Condition** | Victory: Any growth cube reaches a surface tile. Defeat: Flood markers reach the row containing the highest player cube. |
| **Mechanisms** | Resource Management, Area Control, Engine Building |
| **Turn Structure** | 1) Simultaneous spore placement (face-down), 2) Reveal and resolve growth, 3) Event card, 4) Flood rises |
| **Player Count** | 2-4 |
| **Roles** | Four fungal strains: Spreader (movement), Rooted (defense), Lumens (scoring), Toxic (events) |
| **Core Loop** | Place spores, Reveal, Grow, Event, Flood rises, Repeat |

The design includes a full component specification: 30 modular hex tiles, three card types (Event, Structure, Objective), 60 growth cubes, 12 spore tokens, 20 flood markers, 16 structure tokens, and 8 glow markers. Every mechanism maps to a thematic action. Every component serves a mechanical purpose.

### What Generative Ontology Provided

Without the ontology schema, an LLM generating "a cooperative game about bioluminescent fungi" would likely produce vague victory conditions ("escape the cave somehow"), inconsistent mechanisms (mentioning deck-building but specifying no cards), missing components (no actual game pieces defined), and disconnected theme (mechanics unrelated to fungi).

The Generative Ontology framework ensured:

| Requirement | How It Was Enforced |
|-------------|---------------------|
| Complete goal specification | Minimum length constraint on goal field |
| Coherent mechanism-component alignment | Validation function checked that declared mechanisms have matching components |
| Thematic integration | Theme Weaver agent explicitly connected every mechanism to the narrative |
| Playability basics | Required fields for turn structure, uncertainty source, end condition |
| Balance review | Balance Critic agent with "break this" professional anxiety |

The output is not merely plausible. It is *playable*. A designer could take this output, build a prototype, and begin playtesting. The ontology grammar guaranteed that all the essential elements of a game are present and coherent.

If you want to see Generative Ontology in action, [GameGrammar](https://gamegrammar.com) lets you generate complete tabletop game designs from a theme. Enter a concept, and the system produces a structurally validated game with mechanisms, components, and balance analysis, the same pipeline that created Mycelium: The Deep. We are opening the beta soon.

---

## Concluding Remarks

![From Tool to Partner]({{ site.baseurl }}images/generative-ontology-from-game-knowledge-to-game-creation/Generative-Ontology-Grammar_of_Creation_14.png)

_Figure. Generative Ontology enables AI to speak the lingua franca of experts, a partner that understands the grammar of the domain._

In Part 4 [8], we built an ontology that could analyze games. Part 5 has transformed that descriptive vocabulary into a generative grammar. In Whitehead's terms [1], we have given eternal objects, the abstract patterns of game design, a mechanism for becoming actual occasions, concrete games that never existed before [2]. Generative Ontology is creative advance made computational.

Much remains to explore. Could a human designer collaborate with the system in real time, providing creative direction while the engine handles structural completeness? Could AI systems learn ontologies from corpora of successful examples, inducing generative grammars from exemplars rather than encoding them by hand?

The ontology that once helped us *understand* now helps us *create*. This is the promise of Generative Ontology: structured knowledge, made alive. We look forward to sharing what this engine produces when [GameGrammar](https://gamegrammar.com) [10] enters beta.

---

* [Unlocking the Secrets of Tabletop Games Ontology (Part 4)]({{ site.baseurl }}unlocking-secrets-of-tabletop-games-ontology)
* **>>** [Generative Ontology: From Game Knowledge to Game Creation (Part 5)]({{ site.baseurl }}generative-ontology-from-game-knowledge-to-game-creation)

---

## References

[1] Alfred North Whitehead. [*Process and Reality*](https://archive.org/details/processreality0000alfr). Free Press, 1929/1978.
  - Foundation for the eternal objects / actual occasions framework

[2] Timothy Barker. [*Artificial Creativity: A Process Philosophy of Technology Perspective*](https://eprints.gla.ac.uk/327708/1/327708.pdf). Journal of Continental Philosophy, 2024.
  - Connects Whitehead's process philosophy to generative AI creativity

[3] Geoffrey Engelstein and Isaac Shalev. [*Building Blocks of Tabletop Game Design: An Encyclopedia of Mechanisms*](https://www.routledge.com/Building-Blocks-of-Tabletop-Game-Design/Engelstein-Shalev/p/book/9781138365490). CRC Press, 2020.
  - The comprehensive taxonomy underlying our game ontology

[4] Natalya F. Noy and Deborah L. McGuinness. [*Ontology Development 101*](https://protege.stanford.edu/publications/ontology_development/ontology101.pdf). Stanford University.
  - Foundation for ontology design principles

[5] Jorge Martínez-Gil, et al. [*Ontology-Constrained Generation of Domain-Specific Clinical Summaries*](https://arxiv.org/abs/2411.15666). arXiv:2411.15666, Nov 2024.
  - Closest methodological precedent using ontology-guided constrained generation

[6] Roberto Gallotta, et al. [*Large Language Models and Games: A Survey and Roadmap*](https://arxiv.org/html/2402.18659v1). arXiv:2402.18659, Feb 2024.
  - Comprehensive survey of LLM applications in games

[7] Matthew Guzdial, et al. [*Boardwalk: Towards a Framework for Creating Board Games with LLMs*](https://arxiv.org/abs/2508.16447). arXiv:2508.16447, 2025.
  - Board game code generation from rules (contrasts with our design generation approach)

[8] Benny Cheung. [*Unlocking the Secrets of Tabletop Games Ontology*]({{ site.baseurl }}unlocking-secrets-of-tabletop-games-ontology). Feb 2025.
  - Part 4 of the Game Architecture series, foundation for this post

[9] Benny Cheung. [*Process Philosophy for AI Agent Design*]({{ site.baseurl }}process-philosophy-for-ai-agent-design). Jan 2026.
  - Whiteheadian framework connecting to creative advance

[10] [*GameGrammar*](https://gamegrammar.com). Dynamind Research, 2026.
  - AI-powered tabletop game design platform built on Generative Ontology

[11] [*Mycelium: The Deep on GameGrammar*](https://gamegrammar.dynamindresearch.com/s/04HPtDzsTB5P9r7iTZ4yDKVzzVoCNHvRH0y5hwEDIF0). Dynamind Research, 2026.
  - Interactive display of the complete generated game ontology from the case study in this article
