---
layout: post
title: "How AI Actually Designs a Card"
date: 2026-03-24 00:00:00.000000000 -00:00
permalink: how-ai-actually-designs-a-card
author: Benny Cheung
artwork:
  author: Gemini 3 Pro
tags:
- Game Design
- Card Games
- AI
- Tabletop Games
- Prototyping
- Game Architecture
- Race for the Galaxy
category: post
comments: true
image: images/how-ai-actually-designs-a-card/post_cover.jpg
images:
  cover: images/how-ai-actually-designs-a-card/cover2x.jpg
  header: images/how-ai-actually-designs-a-card/header.jpg
  animated-cover: images/how-ai-actually-designs-a-card/animated-cover.webp
published: true
series: "Card Architecture"
series_order: 2
featured: true
featured_order: 1
---

<!--excerpt.start-->
In 2021, I spent a month reverse-engineering Race for the Galaxy. I parsed Keldon Jones's C source code, converted the entire card library into Python, and mapped every phase interaction, every card power, every production chain across 114 unique cards. I did this because the game's AI kept destroying me and I wanted to understand why. What I found was that every card in RFTG carries a structured data model far more complex than its printed text suggests: type, cost, VP value, good type, military flags, and a list of phase-specific powers that interact across five distinct game phases. Five years later, when I started building an AI system that generates card games, I realized the pipeline I needed was a mirror of what I had already done by hand. The AI was not replacing the designer's process. It was formalizing it.
<!--excerpt.end-->

![How AI Actually Designs a Card]({{ site.baseurl }}images/how-ai-actually-designs-a-card/post_cover.jpg)

This is Part 2 of the [Card Architecture series]({{ site.baseurl }}three-waves-of-card-game-design-tools). In Part 1, I traced the evolution of card game tools from scripting to AI-native pipelines. This article goes inside the pipeline itself. But rather than just describing how the AI works, I want to draw a parallel that changed how I think about AI-assisted design: at every stage, the AI is doing a mechanistic version of what a human designer already does. The question is not whether AI can design cards. It is which parts of card design are mechanistic, which parts are not, and what that means for the human designer's role.

---

## How a Human Designs a Card

Before we look at the AI, let me describe what actually happens when a human designer sits down to create a card game. I will use Race for the Galaxy as the reference because I spent a month inside its architecture and because it represents the level of complexity that serious card games demand.

![Race for the Galaxy]({{ site.baseurl }}images/how-ai-actually-designs-a-card/RaceForTheGalaxy.gif)

*Figure 1. Tom Lehmann's Race for the Galaxy (2007) -- 114 unique cards, five simultaneous phases, four production types, military vs civilian settlement. The complexity hiding inside each card is what makes it both a design masterpiece and an AI challenge.*

When Tom Lehmann designed RFTG, the process was roughly this:

**First, the world.** The game needed a theme that could sustain 114 unique cards. Galactic civilization building. Worlds to settle, technologies to develop, goods to produce and trade. The theme is not decoration. It constrains the design space. You cannot have a card called "Corporate Restructuring" in a game about medieval farming, and you cannot have "Harvest Festival" in a game about space colonization. Theme is the first filter.

**Second, the mechanics.** RFTG's signature innovation is simultaneous role selection: all players secretly choose a phase, only chosen phases execute, choosers get a privilege bonus. This mechanic was not an afterthought. It was the skeleton that every card in the game hangs on. Each card carries phase-specific powers. New Vinland produces novelty goods in Phase 5 and consumes any good to draw 2 cards in Phase 4. That dual-phase interaction does not happen by accident. It happens because the designer defined the mechanical skeleton first, then designed cards that exploit its seams.

**Third, the cards themselves.** When I parsed the `cards.txt` file, I found that every RFTG card carries a structured data model:

| Field | Example (New Vinland) | Purpose |
|-------|----------------------|---------|
| Name | New Vinland | Identity |
| Type | World (Type 1) | Mechanical category |
| Cost | 2 | What you pay (discard from hand) |
| VP | 1 | End-game scoring |
| Good Type | Novelty | What it produces |
| Phase 4 Power | Consume any good, draw 2 cards | Trade/consume interaction |
| Phase 5 Power | Produce good of world type | Production engine |

*Table 1. The structured data model behind a single RFTG card. Seven fields, two phase-specific powers, one production chain. This is the complexity the basic schema must capture.*

That is seven structured fields on a single card. Replicant Robots, a development, has a different shape: cost 4, VP 2, and a Phase 3 power that reduces settlement cost by 2. Contact Specialist draws a card whenever you settle a world. Each card is a small program with inputs, outputs, and conditional behavior.

![RFTG New Vinland Card Design]({{ site.baseurl }}images/how-ai-actually-designs-a-card/RFTG_New_Vinland.png)

*Figure 2. New Vinland's card design data (left) alongside the actual card (right). The `cards.txt` encoding -- N:name, T:type:cost:vp, G:good type, P:phase:power -- packs seven structured fields into six lines. Phase IV consumes any good to draw 2 cards. Phase V produces a novelty good. This is the structured data model hiding behind every RFTG card.*

A human designer holds all of this in their head. They have an intuition for which cards the ecosystem needs, which strategic gaps exist, which combinations create satisfying turns. They know, from experience, that a deck full of cheap aggressive cards needs an expensive defensive counter, that a production chain needs both producers and consumers, that a game ending too quickly means the late-game investments are not worth building.

**Fourth, iteration.** Lehmann did not get all 114 cards right on the first pass. He playtested, found broken combinations, removed cards, rebalanced costs, added new ones to fill strategic gaps. The RFTG AI was trained over 30,000 simulated games using temporal difference learning, way before DeepMind made reinforcement learning famous. The AI learned which cards win and which lose through sheer repetition. The iteration is where good cards become great cards.

This four-stage process, theme then mechanics then cards then iteration, is what every experienced card game designer does. Some do it formally with design documents. Some do it in spreadsheets. But the cognitive structure is the same.

The AI pipeline mirrors it exactly.

---

## The Multi-Agent Pipeline

Instead of asking one AI to do everything, the system splits the work across specialized agents, each handling one stage of the process a human designer does by instinct.

![Multi-Agent Pipeline]({{ site.baseurl }}images/how-ai-actually-designs-a-card/Multi_Agent_Pipeline.jpg)

*Figure 3. The multi-agent card generation pipeline. Four specialized agents mirror the four stages of human card design: theme, mechanics, cards, and iteration.*

### Stage 1: The Theme Weaver

*What the designer writes in a concept doc.*

A human designer starts with a concept. "A game about galactic civilizations racing to explore, settle, and develop the galaxy." They sketch the narrative boundaries: the vocabulary, the tone, the kinds of things that exist in this universe. Worlds, developments, goods, trade routes.

The Theme Weaver agent does the same thing. It takes a sentence from the designer and generates a detailed thematic design document that locks in the narrative reality. If the game is about galactic expansion, the AI will not generate a card called "Wheat Field" or "Village Smithy." The document constrains the vocabulary so every subsequent agent speaks the same language.

A human does this unconsciously. The AI needs it written down.

### Stage 2: The Mechanics Architect

*What the designer sketches as a turn structure.*

After the theme, a human designer defines the physics of the cardboard universe. How many phases does a turn have? What resources exist? How do players interact? What triggers the end of the game?

When I reverse-engineered RFTG's game engine, I found that the entire game reduces to a state machine: five phases, each with a set of legal actions, each modifying a shared game state. Draw cards, develop, settle worlds, trade or consume goods, produce. The simultaneous role selection is the outer loop. The phase-specific card powers are the inner loop. Everything else is bookkeeping.

The Mechanics Architect agent generates this same skeleton. It receives the thematic design and produces a mechanics document that defines the turn structure, the resource types, the victory conditions, and the action economy: what a player can physically do on their turn. This is the gravity of the game world. Every card the AI generates later will obey this gravity.

The metaphor I keep coming back to: the mechanics architect builds the physics engine before asking the AI to design bridges.

### Stage 3: The Component Designer

*What the designer types into a spreadsheet.*

With both the theme and the mechanics in hand, the Component Designer agent generates the actual cards. This is the stage where the parallel between human and AI becomes most striking.

Every card the AI generates must conform to a strict schema:

| Field | Purpose | RFTG Equivalent |
|-------|---------|-----------------|
| **Card name** | Identity, must fit the theme | "New Vinland," "Contact Specialist" |
| **Card type** | Mechanical category | World vs. Development |
| **Effect text** | What the card does, as printed | Phase-specific powers |
| **Cost** | What the player pays | Discard cards from hand |
| **Strategic role** | Why this card exists (min 20 characters) | The designer's mental model |

*Table 2. The five-field card schema. The strategic role field externalizes what human designers carry as intuition.*

The last field, strategic role, is the most important. It has a hard minimum of 20 characters. The AI must write an explanation for every card it generates, justifying why the card exists in the game's ecosystem.

Here is the thing: every experienced card game designer carries this justification in their head. They know that New Vinland exists to be a cheap entry point into the novelty production chain. They know that Contact Specialist exists to reward players who invest in settling worlds. They know that Galactic Federation exists to create a scoring payoff for development-heavy strategies.

The difference is that human designers hold this mental model implicitly, and sometimes lose track of it at card 47. The strategic role field forces the AI to make it explicit. And it turns out, forcing anyone to articulate *why* each card exists makes the design better, whether the designer is human or artificial.

### The New Vinland Test

To see this in practice, consider what happens when a game with RFTG-style mechanics runs through the pipeline. The AI does not generate a generic "World Card: worth 1 VP." It has full context about the theme (galactic civilizations), the mechanics (five-phase simultaneous selection with production chains), and the strategic ecosystem.

So it generates something like: "Mining World. Civilian world. Produces rare goods. Cost 3 cards. Strategic role: Mid-cost production world. Rare goods are more valuable in trade, creating a payoff for the higher investment compared to cheaper novelty worlds."

That strategic role statement is the proof that the AI understands the resource hierarchy. Rare goods trade for more than novelty goods. A 3-cost world that produces rare goods is correctly positioned above a 2-cost world that produces novelty goods. The AI is reasoning about the same cost curve that a human designer would sketch in a spreadsheet.

It is not generic mush. It is a card that fits the economic structure of the game.

### Beyond the Five Fields: Card Grammar

The five-field schema works for many card games. But when I went back to RFTG's `cards.txt` and counted the fields per card, I found seven, eight, sometimes more: type, cost, VP, good type, flags, and multiple phase-specific powers. The five-field schema is the floor, not the ceiling.

For complex games, the AI pipeline supports a Card Grammar: a per-game anatomy declaration that tells every agent exactly what structured fields each card carries. Instead of free-form effect text that the system has to parse, the Card Grammar declares typed fields:

- Tags (enum list): Science, Military, Production, Alien
- Production effects (resource delta): produces 2 ore per round
- Resource cost (resource map): costs 3 ore + 2 energy
- Trigger timing (enum): when played, when activated, between turns, game end
- Scoring formula (formula): 3 VP per Military tag in tableau

This is exactly the structure I found inside RFTG's card data, generalized to work for any game. The Card Grammar tells the AI: "In this game, cards have tags, production rates, resource costs, and trigger timing. Generate cards that fill these fields." The result is structured data, not prose, which means the simulation engine can read it directly without guessing.

![Card Grammar Schema]({{ site.baseurl }}images/how-ai-actually-designs-a-card/Card_Grammar_Schema.jpg)

*Figure 4. The Card Grammar extends the five-field schema with typed anatomy fields specific to each game. The same structure I extracted manually from RFTG, the AI now declares and enforces automatically.*

### Stage 4: The Detail Expander

*What the designer does after the first playtest.*

Here is a problem that every card game designer knows intimately. You design 30 cards. You playtest. They are all fine. Balanced. Functional. And completely boring.

A language model has the same tendency. Left to its own devices, it regresses to the mean. It produces safe, statistically average cards that are all roughly the same power level, the same cost range, the same complexity. Functional and forgettable.

A human designer fixes this after the first playtest. They realize the aggro strategy is too strong, so they design a trap card. They notice the late game stalls out, so they add a high-cost bomb that rewards patience. They find that no one is building military because the payoff is not high enough, so they add a 6-cost development that scores 3 VP per Military tag in the tableau.

The Detail Expander agent does the same thing. After the foundational cards are generated, it looks at the batch and deliberately breaks the mold:

- At least one combo card that chains multiple mechanics together
- At least one situational card that is weak in most games but devastating in the right context
- At least one expensive late-game card that rewards long-term investment

In RFTG terms: the foundational batch might produce a set of balanced 2-3 cost worlds. The detail expander would then generate Galactic Federation (6-cost, scores 2 VP per Development tag) or Pan-Galactic League (6-cost, scores 3 VP per Military tag). These are the cards that create divergent strategies. They do not emerge from averaging. They emerge from deliberately forcing outliers.

---

## The Five-Card Generation Rule

After the pipeline finishes its initial run, you have a micro-deck of five to eight diverse, interlocking cards. A proof of concept. But a real game needs 30, 50, even 100 cards. Scaling up introduces a problem that anyone who uses language models will recognize: context degradation.

If you ask an AI for three things, it is brilliant. If you ask it for 50, it starts strong, but by item 14 it has forgotten the constraints it was given 12 items ago.

The system enforces a hard rule: never generate more than five cards in a single request. When scaling to a 50-card deck, the system executes a batch loop: 10 sequential requests for five cards each.

Think of it like asking a friend for restaurant recommendations. "Give me your top three" produces three brilliant, curated picks. "Name 50 restaurants" produces panic and a list of every chain in a ten-mile radius. The language model's attention span works the same way.

![Five Card Batch Loop]({{ site.baseurl }}images/how-ai-actually-designs-a-card/Five_Card_Batch_Loop.jpg)

*Figure 5. The batch loop generates five cards at a time. Each batch sees the full existing card list, identifies strategic gaps, and fills them. Later batches naturally evolve to counter earlier ones.*

But the five-card rule does something more interesting than just maintaining quality. It creates **progressive improvement**.

Each batch analyzes the existing card list before generating. If the first two batches produced cheap, aggressive cards, the third batch notices the imbalance and generates high-cost defensive cards to compensate. Later batches fill strategic gaps left by earlier ones. The AI might invent counter-strategies to the cards it generated three minutes prior.

This is exactly what happens during human playtesting. A designer plays a few hands, finds that the rush strategy dominates, goes back to their desk and designs a card that slows it down. The batch loop compresses that iteration cycle from weeks to minutes, but the cognitive structure is the same: observe the ecosystem, identify the gap, design the counter.

---

## What the AI Can Measure

Before I talk about what the AI cannot do, let me be specific about what it can.

After generating a deck, the system runs Monte Carlo Tree Search simulations: hundreds of games where AI agents play the deck against itself. MCTS is not a language model. It is a planning algorithm that explores decision trees to find winning strategies.

On a 30-card engine builder prototype I designed as a test, the MCTS agent learned to buy production cards early, build conversion infrastructure mid-game, and buy scoring cards late. It won 90% of games against a random player. The AI did not just balance the cards. It discovered the strategy the designer intended.

That 90% win rate is a meaningful signal. It tells the designer: "Your resource economy has strategic depth. There is a learnable curve. The production chain works." If the MCTS win rate were 50%, it would mean the cards are strategically interchangeable, there is nothing to learn, and the economy is flat.

This is the mechanical side of card design, and the AI handles it well. Cost curves, resource balance, dominant strategy detection, statistical fairness. The machine can play a thousand games and tell you that Card A wins 60% of matchups and the military strategy needs a stronger payoff.

---

## What the AI Cannot Do

![What AI Sees vs What AI Cannot See]({{ site.baseurl }}images/how-ai-actually-designs-a-card/What_AI_Cannot_See.jpg)

*Figure 6. The gap between what AI can measure (structural dimensions, balance metrics, fun scores) and what it cannot see (four friends laughing around a table). The bridge between them is you.*

But it cannot measure fun.

I explored this question in depth in [The Theory of Generative Board Game Design]({{ site.baseurl }}gamegrammar-the-theory-of-generative-board-game-design), and the conclusion has only sharpened since. AI cannot *experience* fun. It has never felt the excitement of a close finish, the satisfaction of a clever combo, or the social electricity of pulling off a bluff. It has no taste. It has no feelings.

But here is the nuance: you do not need to feel fun to recognize the *design patterns* that produce it. Hidden information creates tension. Multiple real options create agency. Escalating stakes create drama. The AI can detect these structural ingredients from your turn structure and mechanism choices. A bridge engineer does not need to feel beauty to know the math that makes a bridge elegant.

What the AI cannot do is predict the alchemy. The same mechanic that creates delicious tension for one group might fall flat for another. An algorithm can guarantee mathematical fairness. It can ensure that no single strategy breaks the ecosystem. It can detect that a card is overpowered by win rate, or that a production chain stalls in the mid-game, or that the military path is under-rewarded.

It cannot tell you if playing that card feels satisfying. It cannot measure the tension of a close game where both players reach for the same phase on the same turn. It cannot simulate the joy of building a production engine that suddenly clicks into gear on round five, or the agony of watching your opponent settle Rebel Base when you were one military strength short.

When I played against the RFTG AI, the losses were not frustrating because the AI played optimally. They were frustrating because the *game* created situations where the optimal play produced dramatic outcomes. The AI chose the Produce phase at exactly the moment when my production worlds were loaded and my opponent's were empty. The AI consumed goods for VP on the turn that pushed it past the threshold. The AI did not design those moments. Tom Lehmann did. The AI just played them.

The math ensures the game works. The human designer ensures the game is worth playing. That distinction, between a game that is balanced and a game that is memorable, is where the human role endures.

In my 2021 series, I mapped every component of the RFTG architecture: the [game model]({{ site.baseurl }}game-architecture-card-ai-1), the [action engine]({{ site.baseurl }}game-architecture-card-ai-2), the [neural network AI]({{ site.baseurl }}game-architecture-card-ai-3). I could formalize everything except the feeling of a close game. Five years later, building an AI system that generates card games, that gap has not closed. It has only become more precisely defined.

The useful question is not "Can AI understand fun?" but "Can AI spot the design patterns that tend to produce fun, so you can focus your energy on the parts only a human designer can provide?" The answer to the first is no. The answer to the second is yes. And that is the only question that matters.

The AI manages the map. The human hikes the territory. The map can tell you which paths exist, which are efficient, which lead to dead ends. But it cannot tell you which path has the view that makes you stop and stare. That is the designer's job, and it always will be.

---

*Next in the series: When the Schema Breaks -- where we stress-test the card schema against 13 famous games, find out which ones break it completely, and discover that the gap between a balanced game and a memorable one is the most important problem in AI-assisted design.*

---

## References

- Thomas Lehmann, [Race for the Galaxy](https://boardgamegeek.com/boardgame/28143/race-galaxy), Rio Grande Games, 2007.
- Keldon Jones, [RFTG AI Source Code](https://github.com/bnordli/rftg) (C, GPLv2), 2009.
- Benny Cheung, [Game Architecture for Card Game Model (Part 1)](https://bennycheung.github.io/game-architecture-card-ai-1), bennycheung.github.io, 2021.
- Benny Cheung, [Game Architecture for Card Game Action (Part 2)](https://bennycheung.github.io/game-architecture-card-ai-2), bennycheung.github.io, 2021.
- Benny Cheung, [Game Architecture for Card Game AI (Part 3)](https://bennycheung.github.io/game-architecture-card-ai-3), bennycheung.github.io, 2021.
- Benny Cheung, [Three Waves of Card Game Design Tools](https://bennycheung.github.io/three-waves-of-card-game-design-tools), bennycheung.github.io, 2026.
- Benny Cheung, [The Theory of Generative Board Game Design](https://bennycheung.github.io/gamegrammar-the-theory-of-generative-board-game-design), bennycheung.github.io, 2026.
- Benny Cheung, [Generative Ontology: From Game Knowledge to Game Creation](https://bennycheung.github.io/generative-ontology-from-game-knowledge-to-game-creation), bennycheung.github.io, 2026.
- Benny Cheung, [AI Playtesting: When Your Board Game Tests Itself](https://bennycheung.github.io/ai-playtesting-when-your-game-tests-itself), bennycheung.github.io, 2026.
- [Cardiverse: LLM Card Game Prototyping](https://arxiv.org/abs/2502.07128), EMNLP 2025.
- [Tabletop Simulator](https://store.steampowered.com/app/286160/), Berserk Games.
- [The Game Crafter](https://www.thegamecrafter.com/), Print-on-demand for tabletop games.
