---
layout: post
title: "Card Grammar - Teaching Machines the Rules of Complex Card Games"
date: 2026-03-30 00:00:00.000000000 -00:00
permalink: card-grammar-for-complex-card-games
author: Benny Cheung
artwork:
  author: Gemini 3 Pro
tags:
- Game Design
- Card Games
- Design Tools
- Tabletop Games
- Prototyping
- Game Architecture
- Philosophy
- Nelson Goodman
category: post
comments: true
image: images/card-grammar-for-complex-card-games/post_cover.jpg
images:
  cover: images/card-grammar-for-complex-card-games/cover2x.jpg
  header: images/card-grammar-for-complex-card-games/header.jpg
  animated-cover: images/card-grammar-for-complex-card-games/animated-cover.webp
published: true
series: "Card Architecture"
series_order: 3
featured: true
featured_order: 1
---

<!--excerpt.start-->
We built a pipeline that generates mechanically coherent cards, scales them in five-card batches, exports directly to Tabletop Simulator, and stress-tests balance using tournament algorithms. It sounds like the future of card game design. But when we took 13 of the most influential card games ever published and tried to fit their mechanics into the pipeline's five-field schema, the results were humbling. Dominion mapped perfectly. Sushi Go worked trivially. Then Wingspan shattered the box, Terraforming Mars overwhelmed it, and KeyForge broke it entirely. This is the story of where automated card design hits its limits, what those limits reveal about the nature of game complexity, and how the solution required not better algorithms but a fundamentally different way of thinking about what a card actually is.
<!--excerpt.end-->

![Card Grammar - Teaching Machines the Rules of Complex Card Games]({{ site.baseurl }}images/card-grammar-for-complex-card-games/post_cover.jpg)

This is Part 3 of the [Card Architecture series]({{ site.baseurl }}three-waves-of-card-game-design-tools). In [Part 1]({{ site.baseurl }}three-waves-of-card-game-design-tools), I traced the evolution of card game tools from scripting to design platforms. In [Part 2]({{ site.baseurl }}how-ai-actually-designs-a-card), I went inside the pipeline itself and examined which parts of card design are mechanistic and which parts are not. This article asks the harder question: what happens when the pipeline meets real games?

---

## The Stress Test

The previous articles in this series described a powerful card generation pipeline: a system that reads a game's ontology, generates cards with real mechanical depth, scales them through a batch loop, and exports playable prototypes. It is genuinely impressive technology.

But impressive technology deserves honest testing. To understand the real limits of this approach, we took 13 of the most influential card games ever published, spanning seven distinct archetypes, and aggressively tried to map their cards into the basic five-field schema that the pipeline uses.

That schema, to refresh, is a rigid card template with five fields: card name, card type, effect text, cost, and strategic role. Every generated card must fit inside this template. If you have ever prototyped with index cards, you know the feeling: five lines on the card, and you write "Village / Action / 3 coins / Draw 1 card, +2 Actions." Clean, legible, complete.

The question is: what happens when a game's cards need more than five lines?

The results sorted themselves into four distinct coverage tiers, from perfect fit to total structural mismatch.

![The Edge of the Current Engine]({{ site.baseurl }}images/card-grammar-for-complex-card-games/Schema_Coverage_Tiers.jpg)

_Figure. The coverage cliff from Tier A to Tier D, where the market opportunity lives._

## Tier A (Full): Five Lines Is Enough

| Tier | Schema Fit | What Happens | Games |
|------|-----------|-------------|-------|
| **Full (Tier A)** | Near-perfect | Cards map perfectly. Every mechanical detail survives compression. Balance testing reflects the actual game. | Dominion, Star Realms, Sushi Go! |

![Tier A Games]({{ site.baseurl }}images/card-grammar-for-complex-card-games/CardGame_Tier_A_Games.jpg)

Deck builders and simple drafting games are the schema's sweet spot. A Dominion card has a name (Village), a type (Action), a cost (3 coins), and an effect ("Draw 1 card, +2 Actions"). Five lines on the index card, nothing left out. Star Realms, Sushi Go, Ascension: all near-perfect fits.

But these games represent the shallow end of the complexity pool.

## Tier B (Partial): Squinting at the Rules

| Tier | Schema Fit | What Happens | Games |
|------|-----------|-------------|-------|
| **Partial (Tier B)** | Directionally correct | Core mechanics work but secondary systems are lost. Balance testing misses cross-system interactions. | 7 Wonders, Blood Rage, Res Arcana, Everdell |

![Tier B Games]({{ site.baseurl }}images/card-grammar-for-complex-card-games/CardGame_Tier_B_Games.jpg)

Games like 7 Wonders and Blood Rage introduce mechanics the schema cannot cleanly express: era-based card phasing, prerequisite chains across ages, conditional scoring triggers tied to specific board positions. You can cram this information into the effect text string, but the simulator ends up squinting to understand the rules. The schema does not crash. It degrades gracefully, going blind to the parts of the game it cannot see.

## Tier C (Insufficient): The Template Overflows

| Tier | Schema Fit | What Happens | Games |
|------|-----------|-------------|-------|
| **Insufficient (Tier C)** | ~60-70% data loss | The schema captures a card's name and a flattened cost. The economic engine, the tag system, and the trigger timing all evaporate. | Wingspan, Terraforming Mars, Race for the Galaxy |

![Tier C Games]({{ site.baseurl }}images/card-grammar-for-complex-card-games/CardGame_Tier_C_Games.jpg)

Engine builders are where the schema genuinely breaks. Five lines on an index card is nowhere near enough.

![The Schema Compression Crisis]({{ site.baseurl }}images/card-grammar-for-complex-card-games/Schema_Compression_Crisis.jpg)

Try writing a Wingspan bird card on that index card. You need food cost (1 invertebrate + 1 seed, or 2 wild), habitat restriction (wetland only), egg capacity (2), power trigger timing (when activated, not when played), power text, nest type, wingspan measurement, and bonus traits for end-of-round scoring. That is at least eight structured fields. You start writing smaller, cramming text into margins, abbreviating until the card is unreadable. The simulator faces the same problem: a single bird card carries at least eight structured data fields that cannot be collapsed into the effect text string without losing approximately 60% of the card's actual mechanical data.

Terraforming Mars is worse. Its 208 project cards layer four problems on top of each other: a tag system where cards trigger effects on other cards across every player's tableau, three card colors with fundamentally different lifecycle behaviors (fire once, fire repeatedly, or fire and self-destruct), game-state preconditions that gate card play ("Requires 5% oxygen"), and a dual-track economy where each of six resources has both a permanent production rate and a spendable stockpile. The basic schema misses more than half the game.

In heavy engine builders, cards are social. They talk to each other. The basic schema treats every card as isolated on an island.

## Tier D (Breaks Down): Structural Mismatch

| Tier | Schema Fit | What Happens | Games |
|------|-----------|-------------|-------|
| **Breaks Down (Tier D)** | ~75-85% data loss | The schema is structurally incompatible with the game's card model. Not a matter of missing fields, but a fundamental architectural mismatch. | KeyForge, Spirit Island, Gloomhaven |

![Tier D Games]({{ site.baseurl }}images/card-grammar-for-complex-card-games/CardGame_Tier_D_Games.jpg)

At the bottom tier, the schema is not just missing fields. It is structurally incompatible with the game's card model.

![Tier D Structural Mismatch]({{ site.baseurl }}images/card-grammar-for-complex-card-games/Tier_D_Structural_Mismatch.jpg)

Spirit Island breaks on a different axis entirely: cross-card accumulation. Each power card carries element symbols (Fire, Air, Water) that accumulate across all cards played in a turn, unlocking threshold-gated innate abilities on the Spirit board. You do not play a card just for its printed effect. You play it partly for its element icons, which may unlock a completely different, more powerful ability elsewhere. The schema has no concept of this per-turn element economy that resets every round.

KeyForge and Gloomhaven break the schema on yet another axis: time. A single KeyForge creature card packs four distinct abilities that fire at four different moments (on play, on reap, on fight, on destruction). If the simulator reads the card text as a single script and fires everything simultaneously, it fundamentally breaks the physical reality of the game. It is executing a four-act play as a single scene. Gloomhaven pushes this further: every action card has two independent halves, and choosing the top half means the bottom half *ceases to exist* for that turn. Standard natural language processing fails completely when text is actually a multi-layered conditional timing puzzle.

The problem is not that we need a smarter text reader. The problem is that reading text was never the right approach.

---

## The Solution: Card Grammar

So how does the technology evolve to handle these breaks?

The obvious approach, adding 50 new fields to the schema and hoping for the best, would cause the language model to collapse under prompt weight, hallucinating garbage. The clever approach, building a smarter text reader, fails because of the invisible time dimension we just described. And hardcoding every game from scratch is financially impossible to scale.

The solution required a paradigm shift in how the system thinks about cards.

### The Card IS the Game

The old failing architecture treated a card as a generic object bouncing around inside a game's rules. The game is a box; the card is a piece inside it. But for Wingspan, for Terraforming Mars, for any serious engine builder, the card *is* the game. The card schema does not sit inside the ontology. It practically *is* the ontology.

This insight flips the entire architecture. Instead of trying to fit complex cards into a generic template, each game declares its own **card grammar**: a structured definition of what fields exist on cards in this particular game, when those fields trigger, and how cards are allowed to communicate with each other.

### Three Layers of Card Intelligence

A card grammar has three layers, each solving a specific failure mode from the stress test:

![The Card Grammar Architecture]({{ site.baseurl }}images/card-grammar-for-complex-card-games/Card_Grammar_Three_Layers.jpg)

_Figure. A three-layered optional extension. Basic games skip it entirely with zero regression._

**Anatomy** defines the strict physical fields that are allowed to exist in a given game. A Terraforming Mars card grammar declares fields for tags, card color, requirements, and production effects. A Wingspan grammar declares fields for food cost, habitat, egg capacity, and power trigger type. The fields are mathematically typed. A tag is exclusively a tag. A cost is exclusively a cost. The system never has to guess what a piece of data means from context.

**Lifecycle** defines the rigid timing windows for when things are permitted to trigger. This is the direct answer to the KeyForge and Gloomhaven timing problem. Instead of dumping all effects into a single text block, the grammar declares distinct phases: effects that fire on play, effects that fire on activation, effects that fire between turns, effects that fire at game end. The simulator checks the trigger type and only fires matching abilities at the appropriate game phase.

**Synergies** define the strict rules for how different cards are allowed to communicate with each other. This is what makes Terraforming Mars's tag system work: when a Science tag is played, the engine checks all cards in the tableau for matching triggers. The grammar declares the interaction rules up front, so the simulator can monitor cross-card effects without guessing.

### Sheet Music, Not a Live Concert

The philosopher Nelson Goodman, writing in 1968, formalized a distinction that turns out to be directly useful here. Goodman described the difference between a **score** and a **performance**, between sheet music and a live concert. The sheet music is the strict, unambiguous notation. The concert is the rich, contextual, lived execution.

![The Goodman Connection]({{ site.baseurl }}images/card-grammar-for-complex-card-games/Goodman_Paradigm_Shift.jpg)

_Figure. Score (left) versus performance (right). The grammar is the strict notation. The generated card is the lived execution._

The card grammar definition (the anatomy, the lifecycle, the synergy rules) is the score. Any card generated conforming to that grammar is a compliant performance. Different games have completely different sheet music. The score for Wingspan looks nothing like the score for Terraforming Mars. But the underlying system, the musician, can read all of it. As long as you provide logically sound sheet music, the engine can perform any game.

Goodman called this **finite differentiation**: every element in the notation is distinctly separate, mathematically defined, impossible to confuse. The old failing schema suffered from the opposite, what Goodman called **semantic density**: the boundary between a tag, a cost, and a requirement was all mushed together in one dense paragraph of prose, and a machine does not have the lived human experience required to unravel that density. The card grammar enforces the clean edges that formal systems need to compute.

### What This Means for Designers

When a designer says "I'm making an engine builder about breeding dinosaurs," the system does not just generate flavor text about a T-Rex roaring. It proposes a specific card grammar for this new game: an anatomy layer with tags for carnivores and herbivores, a lifecycle layer where end-of-round events cause extinction triggers, and a synergy layer to handle a food chain production economy. The generated prototype cards carry these strict typed effects baked in.

And crucially, because the system understands the underlying grammar, the balance testing engine can instantly simulate the mechanics. It will run hundreds of automated games and report: "Your Volcanic Eruption card is overpowered. Because of the specific synergy grammar, its Fire tag accidentally triggers an infinite resource loop with four other herbivore cards in the standard deck composition."

No other tool on the market can generate, simulate, balance-test, and export at that level of mechanical complexity. The structural card schema is the moat.


### How We Actually Learn Games

What makes this architecture compelling is that it mirrors how human brains actually process complex board games. When you sit down to learn Terraforming Mars, you do not memorize the text on all 208 cards before playing. Instead, you spend the first 20 minutes learning the specific *grammar* of that game's universe: these icons mean production, those borders mean a one-time event, this phase happens before that phase.

![Mirroring Human Cognition at the Table]({{ site.baseurl }}images/card-grammar-for-complex-card-games/Human_Cognition.jpg)

Once your brain internalizes the grammar, someone can hand you a card you have never seen before and you instantly know how to process it. You are running a mental card grammar simulator. The platform formalizes the same cognitive process.

---

## What Automated Playtesting Actually Reveals

With the card grammar solving the data structure problem, the balance-testing engine can finally do meaningful work on complex games. Running hundreds of simulated games with Monte Carlo Tree Search (MCTS), the same algorithm family behind AlphaGo, produces results that would take a human playtest group months to discover.

![The Power of Automated MCTS Playtesting]({{ site.baseurl }}images/card-grammar-for-complex-card-games/MCTS_Playtesting.jpg)

A 30-card engine builder prototype tested with MCTS showed a 90% skill gap: the strategic agent beat the random agent nine times out of ten. That number is a signal of economic depth. It means the production chains, resource conversions, and scoring paths create genuinely learnable strategy, not just lucky draws. A poorly designed prototype shows a 50-50 split between strategic and random play: the game has no meaningful decisions. The gap between 50% and 90% is the difference between a game that feels arbitrary and one that rewards mastery.

But here is the honest limit. The balance engine can identify that one strategy wins 60% of all matchups. It can guarantee mathematical fairness. It can pinpoint the specific card that breaks the meta and explain *why*: which tag triggers which cascade, which production chain dominates.

It cannot measure fun.

It cannot tell you if playing a particular card feels satisfying. It cannot simulate the tension of a close finish. It cannot quantify the social experience of bluffing your friend into a terrible trade. Goodman would say: any formal system must trade **repleteness** (the full, dense richness of lived experience) for **articulateness** (the sharp edges that computation requires). You cannot have both. A card database has sharp edges: this card costs 3, this strategy wins 60%. The experience of playing the game, the laughter, the agony of a misplay, is dense, contextual, and irreducibly human.

The platform manages the articulate map. The designer navigates the replete territory. The platform reads the sheet music. The designer feels the orchestra.

---

## Concluding Remarks

The card grammar solves the structural problem. Automated playtesting solves the iteration speed problem. But a designer who has already sketched 50 cards, playtested twice, and refined the core loop does not want the platform to *generate* the game. They want the platform to *analyze* the game. Import the rules, run 200 simulated games, and tell them which 12 cards are never played. That is the valuable work.

![The New Symbiosis]({{ site.baseurl }}images/card-grammar-for-complex-card-games/New_Symbiosis.jpg)

The platform handles the computational labor of balance testing, strategy validation, and rule clarity analysis. The designer provides the vision, the taste, and the judgment about what makes a game worth playing.

The spreadsheet era is over. The technology to structurally understand, simulate, and balance complex card games is here. And the designers who thrive will be the ones who understand the difference between a game that is balanced and a game that is alive.

---

*This is Part 3 and the final article in the [Card Architecture series]({{ site.baseurl }}three-waves-of-card-game-design-tools). For the philosophical foundations behind this analysis, see [Part 1: Three Waves of Card Game Design Tools]({{ site.baseurl }}three-waves-of-card-game-design-tools) and [Part 2: How AI Actually Designs a Card]({{ site.baseurl }}how-ai-actually-designs-a-card).*

---

## Appendix: The 12 Games in the Stress Test

These are the card games we tested against the five-field schema, grouped by the coverage tier they fell into. If you are unfamiliar with any of them, the links lead to their BoardGameGeek pages, the definitive community resource for tabletop games.

![Card Game All Tiers Examples]({{ site.baseurl }}images/card-grammar-for-complex-card-games/CardGame_Collage_4_Tiers.jpg)

### Tier A (Full)

**[Dominion](https://boardgamegeek.com/boardgame/36218/dominion)** (Donald X. Vaccarino, 2008). The game that invented the deck-building genre. Players start with identical 10-card decks of weak cards and buy increasingly powerful cards from a shared market, shuffling purchases into their growing decks. Every card is a simple name-type-cost-effect tuple. The schema's perfect match.

**[Star Realms](https://boardgamegeek.com/boardgame/147020/star-realms)** (Robert Dougherty & Darwin Kastle, 2014). A two-player deck builder with faction-based synergies. Cards gain bonus abilities when played alongside other cards from the same faction, which stretches the schema slightly but does not break it. The conditional logic stays within effect text.

**[Sushi Go!](https://boardgamegeek.com/boardgame/133473/sushi-go)** (Phil Walker-Harding, 2013). A lightweight card drafting game where players simultaneously pick cards from hands passed around the table. No resource costs at all. The cost field is null and the game works. Pure set collection scoring that the schema handles trivially.

### Tier B (Partial)

**[7 Wonders](https://boardgamegeek.com/boardgame/68448/7-wonders)** (Antoine Bauza, 2010). Card drafting across three ages with a chaining mechanism: building certain cards in earlier ages lets you build specific later cards for free. The schema has no field for age phasing or prerequisite chains, so the balance tester misses these cross-age interactions.

**[Blood Rage](https://boardgamegeek.com/boardgame/170216/blood-rage)** (Eric M. Lang, 2015). A Viking-themed area control game with card drafting. Cards carry variable battle strength values and age-specific quest conditions that encode spatial and temporal scoring triggers, more than a single effect text string can cleanly represent.

**[Res Arcana](https://boardgamegeek.com/boardgame/262712/res-arcana)** (Thomas Lehmann, 2019). A tight engine builder with only 8 cards per player. Each card converts specific essence types into other essences or victory points. The multi-resource conversion economy exceeds what a flat cost field can express.

**[Everdell](https://boardgamegeek.com/boardgame/199792/everdell)** (James A. Wilson, 2018). A tableau-building game where players place critters and constructions into a personal city. Cards have occupancy limits, seasonal availability, and cross-card pairing bonuses that the basic schema loses.

### Tier C (Insufficient)

**[Wingspan](https://boardgamegeek.com/boardgame/266192/wingspan)** (Elizabeth Hargrave, 2019). 170 unique bird cards, each carrying 8+ structured data fields: multi-type food costs, habitat placement restrictions, egg capacity, four distinct power trigger timings, and bonus trait tags for end-of-round scoring. The schema loses approximately 60% of each card's mechanical data.

**[Terraforming Mars](https://boardgamegeek.com/boardgame/167791/terraforming-mars)** (Jacob Fryxelius, 2016). 208 project cards encoding an entire economic subsystem: tag-driven cross-card synergies, game-state preconditions gating card play, a dual-track production/stockpile economy across six resource types, and three card colors with fundamentally different lifecycle behaviors. Approximately 70% data loss.

**[Race for the Galaxy](https://boardgamegeek.com/boardgame/28143/race-for-the-galaxy)** (Thomas Lehmann, 2007). Every card serves triple duty as currency (discard to pay), tableau engine (ongoing production and consumption powers), and victory points (conditional end-game scoring formulas). The unified card economy where discarding a card to pay for another card *is* the resource system has no representation in the basic schema.

### Tier D (Breaks Down)

**[KeyForge](https://boardgamegeek.com/boardgame/257501/keyforge-call-of-the-archons)** (Richard Garfield, 2018). Every creature card has up to four distinct abilities on different timing triggers (play, reap, fight, destroyed), and the house-selection meta-mechanic replaces the entire concept of resource costs. The schema is structurally incompatible with the game's design.

**[Spirit Island](https://boardgamegeek.com/boardgame/162886/spirit-island)** (R. Eric Reuss, 2017). Power cards carry element symbols that accumulate across all cards played in a turn, unlocking threshold-gated innate abilities on the Spirit board. This cross-card element accumulation system (which resets every turn, unlike Terraforming Mars tags) has no schema representation.

**[Gloomhaven](https://boardgamegeek.com/boardgame/174430/gloomhaven)** (Isaac Childres, 2017). Every action card has two independent halves (top and bottom) separated by an initiative number. Players select two cards per turn, using the top of one and the bottom of the other. The combinatorial dual-half selection, initiative-based turn ordering, and permanent card loss as a stamina clock produce an 85% compression loss, the highest of any game tested.

---

## References

- Nelson Goodman, *Languages of Art: An Approach to a Theory of Symbols*, Hackett Publishing, 1968.
- Jesse Schell, *The Art of Game Design: A Book of Lenses*, CRC Press, 3rd Edition, 2019.
- Geoffrey Engelstein and Isaac Shalev, *Building Blocks of Tabletop Game Design*, CRC Press, 2019.
- [LUDUS: Auto Battler Card Balancing](https://cdn.aaai.org/ojs/21550/21550-13-25563-1-2-20220628.pdf), AAAI 2022
- [Cardiverse: LLM Card Game Prototyping](https://arxiv.org/abs/2502.07128), EMNLP 2025
- Alexandre Verlaine, "Introducing Card Games in Ludii," UCLouvain Master's Thesis, 2025.
- Benny Cheung, [Generative Ontology: From Game Knowledge to Game Creation]({{ site.baseurl }}generative-ontology-from-game-knowledge-to-game-creation), bennycheung.github.io, 2026.
- Benny Cheung, [AI Playtesting: When Your Board Game Tests Itself]({{ site.baseurl }}ai-playtesting-when-your-game-tests-itself), bennycheung.github.io, 2026.
