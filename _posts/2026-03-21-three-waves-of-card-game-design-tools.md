---
layout: post
title: "Three Waves of Card Game Design Tools"
date: 2026-03-21 12:00:00.000000000 -00:00
permalink: three-waves-of-card-game-design-tools
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
category: post
comments: true
image: images/three-waves-of-card-game-design-tools/post_cover.jpg
images:
  cover: images/three-waves-of-card-game-design-tools/cover2x.jpg
  header: images/three-waves-of-card-game-design-tools/header.jpg
published: true
series: "Card Architecture"
series_order: 1
---

<!--excerpt.start-->
Have you ever opened a brand new card game, flipped through 200 unique cards with interlocking abilities and perfectly tuned costs, and wondered how someone designed all of that without going completely insane? Behind every elegant piece of cardboard is a staggering web of math, probability, edge case testing, and tedious layout formatting. Over the past 15 years, the tools available to card game designers have undergone three distinct waves of evolution, each one fundamentally changing what it means to create a game. This article traces that arc from the scripting trenches of the mid-2000s to the AI-native pipelines of 2026.
<!--excerpt.end-->

This is Part 1 of the Card Architecture series. The series explores how the craft of card game creation is being transformed by new tools and AI-native pipelines. In this article, we trace the evolution. Parts 2 through 5 will follow, covering multi-agent card generation, the schema limits exposed by famous games like Wingspan and Terraforming Mars, the export pipeline from data to playable prototype, and the algorithms that draw board game maps.

---

## The Minor Miracle of a Finished Deck

When you hold a finished card game in your hands, you are holding a minor miracle. Every card in that deck has to talk to every other card. The costs have to scale with the power. The combos have to exist without being degenerate. The types have to distribute across the deck so that no strategy completely dominates. And every single piece of rules text has to be unambiguous enough that two strangers can sit down and agree on what it means.

If even one number is off, the whole ecosystem collapses. A card that costs one resource too little warps the meta. A combo that the designer missed creates an unbeatable strategy that players discover on their second game night. A piece of ambiguous text spawns a 200-comment thread on BoardGameGeek about whether "adjacent" includes diagonals.

For decades, the barrier to entry in game design was not having a good idea. Good ideas are everywhere. The barrier was having the sheer clerical stamina to manage the data. Hundreds of cards, each with five to ten interdependent fields, all living in a spreadsheet that grows more fragile with every edit. The history of card game design tools is the history of chipping away at that clerical burden, freeing designers to focus on the part that actually matters: making the game fun.

That history falls into three clear waves.

![Three Waves of Card Game Design Tools]({{ site.baseurl }}images/three-waves-of-card-game-design-tools/Three_Waves_Overview.jpg)
*Figure 1. The three waves of card game design tools: from scripting and spreadsheets, to visual editors, to AI-native pipelines that understand your game.*

## Wave 1: The Template Era (2006-2010s)

### Scripts, Spreadsheets, and Pixel Coordinates

![The Template Era]({{ site.baseurl }}images/three-waves-of-card-game-design-tools/Three_Waves_Template_Era.jpg)
*Figure 2. Wave 1: the designer's reality, surrounded by spreadsheets, scripts, and pixel coordinates, wrestling data into cards by brute force.*

The first wave of dedicated card game tools began with nanDECK [1], a free Windows scripting language released in 2006, and matured through the 2010s with tools like Squib [2] (an open-source Ruby framework, 2014) and CardPen [5] (a browser-based HTML/CSS generator). These tools were a real step up from doing everything by hand in Photoshop, but using them felt less like game design and more like software engineering.

In this era, a card game was treated purely as a layout problem. All of your game data lived in a massive Excel spreadsheet or a CSV file. Row one was your basic attack card. Row two was your defense card. Row 150 was your ultimate boss monster. Column A was the name. Column B was the cost. Column C was the rules text. And so on, for as many columns as your game demanded.

The Wave 1 tools acted as mail merge on steroids. You wrote a script that said: take the text from column A and print it in a 24-point font at these exact x and y pixel coordinates on the image canvas. Take the number from column B and render it inside this icon template at position (45, 120). Repeat for every row in the spreadsheet.

### The Three-Pixel Problem

If you have ever used one of these tools, you know the friction firsthand. If you decided that the cost icon needed to be moved three pixels to the left because it was crowding the title, you were not dragging an image with your mouse. You were opening a code editor, changing an x-coordinate from 45 to 42, recompiling the entire deck, waiting for it to render all 200 cards, and then praying it looked right.

And if one of your cards happened to have a title that was slightly too long and broke the text wrapping? You had to write a conditional statement in your code just to shrink the font size for that one specific card. A purely visual problem required a programming solution.

This sounds miserable, and in many ways it was. But Wave 1 tools gave designers something valuable: total control. Every pixel was deterministic. Every layout decision was reproducible. If you ran the script twice with the same data, you got the exact same output. For veteran designers who valued precision over convenience, this was worth the pain.

### What Wave 1 Could Not Do

But for all their rendering power, Wave 1 tools were blind to the game itself. nanDECK could not tell you if your cards were fun to play, if your pirate-themed deck builder had a dominant strategy, or if your resource curve was broken. It knew nothing about your game. It just knew how to print a spreadsheet.

The content, the actual game design, lived entirely in the designer's head and in the rows of that spreadsheet. The tool was a printer, not a partner.

What designers needed was not better rendering. They needed less friction. Wave 2 delivered exactly that.

By the mid-2020s, the tool landscape had diversified into four distinct quadrants, each solving a different piece of the design-to-table pipeline.

![The 2026 Tool Landscape]({{ site.baseurl }}images/three-waves-of-card-game-design-tools/Three_Waves_Tool_Landscape.jpg)
*Figure 3. The 2026 tool landscape across four quadrants: scriptable developer tools (nanDECK, Squib, CardPen), WYSIWYG GUI tools (Component.Studio, Dextrous, Tabletop Creator), print-on-demand services (The Game Crafter, MakePlayingCards), and digital prototyping platforms (Tabletop Simulator, Screentop, Tabletopia).*

## Wave 2: The GUI Era (Late 2010s-2020s)

### Visual Editors and Export Pipelines

![The GUI Era]({{ site.baseurl }}images/three-waves-of-card-game-design-tools/Three_Waves_GUI_Era.jpg)
*Figure 4. Wave 2: visual editors with one-click export pipelines for Tabletop Simulator, print-on-demand, and PDF.*

Starting with Component.Studio [3] in 2017 and accelerating through the early 2020s with Dextrous [4] and Tabletop Creator, a new generation of tools introduced something that seems obvious in retrospect but changed everything: visual editors.

For the first time, card game designers could drag and drop text boxes onto a visual canvas instead of calculating x and y coordinates in their heads. They could see the card as they were building it. They could resize elements with a mouse, preview the deck in real time, and iterate on the layout without touching a line of code.

It was basically desktop publishing software, but specifically built for tabletop games. InDesign for nerds.

### Solving the Deployment Problem

Beyond the visual editor, Wave 2 tools solved a second major pain point: deployment. Getting a finished design out of the tool and onto a table had always been awkward. You would export a folder full of raw image files and then spend hours manually importing them into Tabletop Simulator [6], formatting them for print-on-demand services, or arranging them into printable sheets for home prototyping.

Wave 2 tools built direct export pipelines. A single button press could format your deck for Tabletop Simulator, send it to The Game Crafter [7] for physical printing, or generate a PDF laid out for standard card sleeves. The friction between "I finished designing" and "I am playing the game" collapsed from days to minutes.

For the prototyping workflow, this was enormous. The traditional cycle of export, format, upload, test, realize the game is broken, cry, and repeat was dramatically shortened. Designers could iterate faster than ever.

### The Blank Page Remained

Wave 2 made formatting easier, exporting seamless, and iteration faster. But the content bottleneck was identical to Wave 1. You were still staring at a spreadsheet, hand-typing 200 rows of card data, and trying to balance the math in your own head. The tool could make your cards look professional and get them onto a table fast, but it could not help you figure out what the cards should actually do.

Think of it this way: if Wave 1 gave a writer a clunky printing press, Wave 2 gave them Microsoft Word. The output was prettier, but the writer still had to write the book. The blank page problem, the hard creative and mathematical work of designing the game itself, was completely untouched.

That is the problem Wave 3 was built to solve.

## Wave 3: The AI-Native Era (2025+)

### Automating the Invention

![The AI-Native Era]({{ site.baseurl }}images/three-waves-of-card-game-design-tools/Three_Waves_AI_Native.jpg)
*Figure 5. Wave 3: the AI reads your game's ontology and generates balanced cards with mechanics, costs, and synergies. The tool becomes a design partner.*

Wave 3 breaks the pattern entirely. Tools emerging in 2025 and 2026 are no longer automating the layout or the export. They are automating the invention.

The spreadsheet is removed entirely as the source of truth. Instead, the foundation of your game becomes a structured game description, known in the research literature as an ontology. If you want to understand the ontology approach in depth, I wrote a deep dive on the topic in [Generative Ontology: From Game Knowledge to Game Creation]({{ site.baseurl }}generative-ontology-from-game-knowledge-to-game-creation).

An ontology is a machine-readable map of your game's DNA. It defines the core reality of your game: the theme, the primary mechanics, the resources players use, the turn phases, how victory is achieved, and how all those elements interact with each other.

You feed this DNA map into the AI, and the AI generates the spreadsheet for you. It is not just laying out the cards. It is authoring the rules text, the costs, and the specific mechanics based on the laws of the universe you defined.

To return to the writer analogy: Wave 3 gives the writer a co-author who deeply understands their genre and can draft chapters for them. The writer still sets the vision and the direction. The co-author handles the labor of turning that vision into pages.

### The Migration of Value

This shift changes where the competitive advantage lies:

| Wave | Era | Competitive Advantage |
|------|-----|----------------------|
| **Wave 1** | 2006-2010s | Rendering quality: pixel-perfect card images from data |
| **Wave 2** | Late 2010s-2020s | Export breadth: how quickly cards reach TTS or print |
| **Wave 3** | 2025+ | Content intelligence: the tool understands your game's strategy |

A Wave 1 or Wave 2 tool does not know that your pirate-themed deck builder desperately needs a counter to a dominant "hoard gold" strategy. To those tools, a card is just a string of characters. A Wave 3 tool reads the ontology, recognizes the resource economy, and generates cards that actively participate in balancing the ecosystem. The tool that started as a printer has finally become a partner.

### What Changed to Make This Possible

Three technical shifts converged to enable Wave 3:

**Large language models became reliable enough for structured output.** Early LLMs could write creative text, but they could not consistently produce data in a rigid schema. By 2025, models like Claude and GPT-4 could reliably output structured JSON with specific fields, types, and constraints, making them usable as data generators, not just text generators.

**Multi-agent architectures replaced single prompts.** Asking one AI to "make a card game" produces generic mush. But splitting the task across specialized agents (one for theme, one for mechanics, one for card generation, one for balance testing) produces output with real mechanical depth. Each agent focuses on what it does best, and the pipeline enforces quality at every stage. Cardiverse [11], an academic system presented at EMNLP 2025, demonstrated this approach with graph-based mechanic indexing and self-play validation.

**Automated playtesting became computationally feasible.** Algorithms like Monte Carlo Tree Search, the same family that powered AlphaGo, can now simulate thousands of games in minutes. This means a generated deck can be stress-tested for dominant strategies and balance issues before a human ever touches it. The designer gets a mathematical report on whether the game works, not just a pile of cards and a hope. For a deep dive into how this works, see [AI Playtesting: When Your Board Game Tests Itself]({{ site.baseurl }}ai-playtesting-when-your-game-tests-itself).

Together, these three shifts turned what was once a thought experiment into a working pipeline.

## What This Means for Designers

![The Designer's Evolving Role]({{ site.baseurl }}images/three-waves-of-card-game-design-tools/Three_Waves_Designer_Role.jpg)
*Figure 6. The designer's role evolves: from spreadsheet manager to creative visionary, with AI handling the data while humans define the vision.*

### From Spreadsheet Manager to Creative Director

For 15 years, being a card game designer meant being a spreadsheet manager first and a creative visionary second. You spent 80% of your time on data entry, layout formatting, and manual balance calculations. The remaining 20% was the actual design work: choosing mechanics, crafting theme, engineering the moments that make a game memorable.

Wave 3 inverts that ratio. The machine handles the data entry, the layout, the initial balance pass, and the formatting. The designer gets to focus on what they actually care about: what the game should feel like, what decisions should be agonizing, what moments should make players laugh or groan or slam the table.

The anxiety around AI in creative fields is real and justified. But nobody became a game designer because they love updating spreadsheets. Nobody dreamed of spending a Saturday afternoon adjusting x-coordinates in a scripting language. Those were necessary evils, tolls you paid on the road to the creative work. Wave 3 eliminates the tolls, not the road.

The designer who understands game systems, who can identify a missing counter-strategy, who can feel that the midgame needs a crisis event to prevent stalling, that designer is more important than ever. The machine can generate 200 cards. It cannot decide which 200 cards the game actually needs.

### The New Skill: Describing Constraints

What has changed is the skill the designer needs to bring to the table. In Wave 1, the critical skill was scripting. In Wave 2, it was visual layout. In Wave 3, the critical skill is the ability to describe the constraints of your game with precision.

The AI's output is only as good as the ontology you feed it. A vague description produces vague cards. A precise, well-structured description of your mechanics, resources, turn phases, and victory conditions produces cards that interlock, synergize, and challenge.

The designer's job is shifting from "fill in the spreadsheet" to "define the universe." From data entry to world building. From typing numbers into cells to articulating the laws of physics that govern your cardboard reality.

That is not a demotion. That is what game design was always supposed to be.

## What Comes Next

Wave 3 is powerful, but it is not the end of the story. The current generation of AI-native tools excels at certain types of card games, particularly deck builders and simple drafting games, where the card data model maps cleanly to a structured schema. But as we will explore in the next article in this series, more complex games expose fundamental limits in how AI represents cards.

Engine builders like Wingspan and Terraforming Mars, with their multi-resource costs and cross-card synergy systems, challenge the basic assumptions of the schema. Living card games like Arkham Horror require entirely separate data models for player cards and encounter cards. And games like KeyForge, where a single card has four distinct abilities that fire at different phases of the game, break the schema entirely.

The tools are evolving to meet these challenges. But the gap between what AI can design today and what the most ambitious designers aspire to create is where the most interesting work is happening.

For now, the takeaway is simple: if you have a game idea sketched on a napkin, the barrier between that napkin and a playable, balanced, exportable prototype has never been lower. You do not need to be a spreadsheet wizard, a programmer, or a graphic designer.

You just need to understand games. The machines are ready to handle the rest.

---

## Series Navigation

* **>>** [Three Waves of Card Game Design Tools (Part 1)]({{ site.baseurl }}three-waves-of-card-game-design-tools)
* How AI Actually Designs a Card (Part 2) -- coming soon
* When the Schema Breaks (Part 3) -- coming soon
* From Code to Cardboard (Part 4) -- coming soon
* The Geometry of Strategy (Part 5) -- coming soon

---

## References

[1] nanDECK. [*nanDECK Card Generation Tool*](https://nandeck.com/). Free Windows scripting language for card layout and rendering.

[2] Andy Meneely. [*Squib: A Ruby DSL for Card Prototyping*](https://github.com/andymeneely/squib). Open-source framework for programmatic card generation.

[3] Component.Studio. [*Web-based Card Design with Google Sheets Integration*](https://component.studio/). WYSIWYG card design tool with data-driven templates.

[4] Dextrous. [*Modern WYSIWYG Card Design*](https://www.dextrous.com.au/). Visual editor with TTS and print-on-demand export.

[5] CardPen. [*Browser-based HTML/CSS Card Generator*](https://cardpen.mcdemarco.net/). Lightweight web tool for card prototyping.

[6] Berserk Games. [*Tabletop Simulator*](https://store.steampowered.com/app/286160/). 3D physics sandbox for digital board game prototyping.

[7] The Game Crafter. [*Print-on-Demand for Tabletop Games*](https://www.thegamecrafter.com/). Physical production service for indie designers.

[8] MakePlayingCards. [*Volume Card Printing*](https://makeplayingcards.com/). Mid-to-high volume card production.

[9] Geoffrey Engelstein and Isaac Shalev. [*Building Blocks of Tabletop Game Design: An Encyclopedia of Mechanisms*](https://www.routledge.com/Building-Blocks-of-Tabletop-Game-Design-An-Encyclopedia-of-Mechanisms/Engelstein-Shalev/p/book/9781138365490). CRC Press, 2019.
  - The definitive taxonomy of tabletop game mechanisms, providing the vocabulary that AI ontologies use to classify mechanics.

[10] Benny Cheung. [*Generative Ontology: From Game Knowledge to Game Creation*](https://bennycheung.github.io/generative-ontology-from-game-knowledge-to-game-creation). bennycheung.github.io, 2026.
  - Deep dive into the ontology-driven approach to AI game design.

[11] Danrui Li, Sen Zhang, Samuel S. Sohn, Kaidong Hu, Muhammad Usman, and Mubbasir Kapadia. [*Cardiverse: Harnessing LLMs for Novel Card Game Prototyping*](https://arxiv.org/abs/2502.07128). EMNLP 2025.
  - Academic research on multi-agent LLM pipelines for card game generation, using graph-based mechanic indexing and self-play validation.
