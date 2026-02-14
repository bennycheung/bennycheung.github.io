---
layout: post
title: "Nova - The AI Co-Designer That Learns Your Taste"
date: 2026-02-13 12:00:00.000000000 -00:00
permalink: nova-the-ai-co-designer-that-learns-your-taste
author: Benny Cheung
artwork:
  author: Gemini 3 Pro
tags:
- AI
- Game Design
- Tabletop Games
- Co-Design
- Conversational AI
- Reinforcement Learning
- Human-AI Collaboration
category: post
comments: true
image: images/nova-the-ai-co-designer/post_cover.jpg
images:
  cover: images/nova-the-ai-co-designer/cover2x.jpg
  header: images/nova-the-ai-co-designer/header.jpg
  animated-cover: images/nova-the-ai-co-designer/animated-cover.webp 
published: true
series: "Game Architecture"
series_order: 7
featured: true
featured_order: 1
---

<!--excerpt.start-->
In the previous article, we laid out the theory behind GameGrammar: structure enables generation, generation enables iteration, and the designer stays in the chair. But something was missing. The designer still worked through buttons and forms. The AI was a toolbox, not a colleague. This article introduces Nova, a conversational AI co-designer that remembers your decisions, learns your taste, explains its reasoning, and gets better at helping you the more you work together. It is not a chatbot bolted onto a design tool. It is the closing of a reinforcement learning loop that turns every design session into training data for a better partnership.
<!--excerpt.end-->

![Nova: The AI Co-Designer]({{ site.baseurl }}images/nova-the-ai-co-designer/Nova_Co_Designer_Theme.jpg)

_Figure. A designer and their AI co-designer, working together on a board game blueprint. Nova is not a robot. It is a pattern of light, a constellation that accumulates the designer's intent and helps them flare with creative energy._

## Where We Left Off

In [The Theory of Generative Board Game Design]({{ site.baseurl }}gamegrammar-the-theory-of-generative-board-game-design) [2], we established a principle: **AI proposes, you decide.** GameGrammar gives you a structured first draft, flags contradictions, rewrites stale sections, and scores your design across six dimensions. The designer stays in the author's chair. The AI stays in the assistant's seat.

That principle holds. But the interaction model had a gap.

When you used GameGrammar's AI assistance, you clicked buttons. "Fix this inconsistency." "Rewrite this section." "Show me suggestions." Each action was a one-shot transaction. The AI did not remember what you asked last time. It did not know that you had already rejected the auction mechanism because it clashed with your game's tempo. It did not learn that you consistently prefer indirect competition over direct conflict, or that your complexity sweet spot is somewhere between Azul and Terraforming Mars.

Every session started from zero. The AI had the structural intelligence to analyze your game, but no memory of the designer behind it.

That is the gap Nova closes.

---

## The Morning Standup That Does Not Exist

The idea for Nova came from a GameGrammar [4] user named Donald, an experienced game designer who saw the potential before we did:

> "Have you thought about having a running chat with an AI about the game holistically, who would know when to kick something to one of the agents? Similar to a morning discussion about yesterday's prototype that would be happening in creator studios."

Donald was describing something specific: the standup meeting that every professional design studio has. You walk in. Your collaborator already knows your game. They remember yesterday's decisions. They have opinions, but they are your opinions filtered through a different perspective. You say "the auction mechanism felt too slow at four players" and they do not ask you to explain what an auction mechanism is or what game you are working on. They trace the ripple effects and present options.

That collaborator does not exist for solo designers. It does not exist for small teams working evenings and weekends. The talent and vision are there. The time for a second brain is not.

We named it perfectly: Nova. From the Latin *nova stella*, a new star. In astronomy, a nova is a white dwarf that suddenly flares with intense brightness when it accumulates enough material from a companion star. The star is not destroyed. It keeps going. Nova accumulates the designer's intent, taste, and context, and helps them flare with creative energy they would not have reached alone. It is not replacing the star. It is fueling it.

---

## From Toolbox to Colleague

The difference between a toolbox and a colleague is not intelligence. It is continuity.

A toolbox waits for you to pick it up. You select the right tool, apply it, put it back. Each use is independent. A colleague walks alongside you. They remember what you tried. They know what you care about. They push back when your instincts are leading you in circles, and they propose things you would not have considered but immediately recognize as right.

![From Toolbox to Colleague]({{ site.baseurl }}images/nova-the-ai-co-designer/Nova_Toolbox_vs_Colleague.jpg)

_Figure. Left: a workbench with tools laid out neatly, each use independent. Right: two collaborators in conversation, context accumulating between them. The shift from toolbox to colleague is the shift from stateless to stateful._

GameGrammar's previous AI assistance was a toolbox: five modes of help (rewrite, fix, edit, suggest, evaluate), each powerful on its own, each stateless. Nova unifies those five modes into a single conversation where context accumulates instead of resetting.

| Before Nova | With Nova |
|-------------|-----------|
| Click "Fix" on a critique issue | "The scoring curve feels flat" |
| Type intent in a modal | "Make this less punishing at 4 players" |
| Click "Get Suggestions" | Nova proactively surfaces ideas in conversation |
| Click "Regenerate" on a stale section | "The synergies feel outdated after our last change" |
| Click "Re-Evaluate" to score | "How did that change affect the balance?" |

The designer never sees agent names. They never select a mode. They talk to Nova. Nova decides which specialist to invoke, collects the results, and presents them as a coherent conversational response. The orchestration is invisible.

This is not a chatbot. A chatbot is a text interface to a single model. Nova is a conversational layer on top of a multi-agent pipeline [6]. Six specialist agents, a structured game ontology, a reference library of 2,000 published games, and a persistent memory of every decision you have made, all accessible through natural language [5].

---

## The Reinforcement Learning Loop

Here is the idea at the center of Nova, the reason it is more than a chat interface. Every interaction with Nova feeds a cycle that makes the next interaction better.

![The Reinforcement Learning Loop]({{ site.baseurl }}images/nova-the-ai-co-designer/Nova_Reinforcement_Learning_Loop.jpg)

_Figure. The five-stage reinforcement learning cycle at Nova's core. Learn builds a profile from your decisions. Trace captures reasoning chains. Explain presents conclusions with evidence. Reason surfaces intervention options at different levels of abstraction. Track records every decision. The cycle closes: tracked decisions feed the learning profile, and the partnership improves with use._

**Learn.** Nova builds a profile of your design preferences. Not from a form you fill out, but from the pattern of what you accept and reject across sessions. Mechanism affinities, complexity tolerance, theme preferences, interaction style, risk appetite. The profile updates with every decision using an exponential moving average: recent choices weigh more, but old patterns do not vanish overnight.

**Trace.** When Nova analyzes your design, it does not just announce conclusions. It traces a reasoning chain: observation (what was measured), data (the specific numbers), mechanism (the game structure causing the pattern), and impact (what breaks downstream). The designer sees not just "this is unbalanced" but the full evidence trail that led there.

**Explain.** Nova presents the conclusion first, for quick scanning. The reasoning chain is always available. The designer can ask "Why?" and get the forensic breakdown. This mirrors how a real design partner works: they tell you the problem, and you ask clarifying questions when you need the depth.

**Reason.** After presenting the evidence, Nova surfaces decision levels. Not one fix, but a menu of intervention strategies at different levels of abstraction:

| Decision Level | What It Means | Example |
|----------------|---------------|---------|
| **Structural** | Redesign the mechanism or flow | Change how rounds scale with player count |
| **Numerical** | Adjust parameters or thresholds | Tune the draw rate or pool growth formulas |

The designer chooses which level to operate at. This is the actual lead-designer decision: not "fix the problem" but "at what level should I intervene?"

**Track.** Every decision, whether accepted, rejected, or deferred, is recorded in a structured decision log linked to the game's version history. When the designer returns tomorrow, Nova reconstructs context from the current game state plus the decision log, not from replaying raw conversations. The designer picks up where they left off.

The cycle closes. Tracked decisions feed the learning profile. The profile shapes future proposals. Better proposals lead to more informative accept/reject signals. The partnership improves with use.

This is not supervised learning or gradient descent. It is a lightweight reinforcement signal: the designer's accept/reject pattern shapes Nova's proposals through profile-weighted prompting. But the structure is the same as any learning loop. Observe, act, get feedback, adapt.

---

## Not a Copy of You

The first instinct with personalization is to make Nova a mirror. Learn what the designer likes, propose more of it. This is a trap. Donald identified it immediately:

> "Nova could be uniquely helpful because it learns and proposes things in a way I would, BUT it isn't locked into particular taste patterns. It's like how when you want to build a powerful team, you add people who understand you and what you are trying to do, but aren't copies of you."

A designer with 30 years of experience has powerful pattern recognition, but also powerful pattern *lock-in*. They reach for familiar solutions because those solutions have worked before. The value of a good collaborator is not "me but faster." It is "me but with fresh eyes." Someone who understands your intent and quality bar but is not constrained by your habitual approaches.

Nova's designer profile captures *intent and standards*, not *habits*. What you care about (theme coherence, elegant mechanisms, tight player interaction), not what you usually do (engine building, indirect competition, medium complexity). The best proposals are the ones you would not have thought of but immediately recognize as right.

![Nova Designer Profile]({{ site.baseurl }}images/nova-the-ai-co-designer/Nova_Designer_Profile.jpg)

_Figure. The designer profile is not a form you fill out. It is the accumulation of accept/reject decisions, updated via exponential moving average so recent choices weigh more._

To prevent convergence on familiar patterns, Nova uses an explore/exploit framework borrowed from recommendation systems:

| Strategy | Frequency | Effect |
|----------|-----------|--------|
| **Exploit** (aligned) | ~70% | Proposals aligned with your demonstrated preferences |
| **Explore-adjacent** | ~20% | One step outside your comfort zone: a familiar mechanism combined with something you have not tried |
| **Explore-novel** | ~10% | Draw from parts of the design space you have never touched |

The ratios adapt. If you consistently accept novel proposals, Nova increases the explore percentage. If you consistently reject them, it pulls back. The system tracks acceptance rates separately for exploit and explore proposals, creating a feedback loop on the feedback loop.

The result is a collaborator who gets you but does not become you. One who says: "I know you usually go for engine building here, but have you considered a negotiation mechanism? It pairs with the worker placement in a way that creates the indirect competition you prefer, but through a mechanism you have not explored." And you think: *huh, that is actually interesting.*

---

## Show Your Thinking

The most requested upgrade from experienced designers was not more features. It was more transparency. Donald articulated the frustration precisely:

> "I wish I had more information. Not always knowing HOW or WHY Nova highlighted something. I was in a game jam, I could ask the game developer 'what did you see that led you there?' Some critiques are just obvious because I'm inferring the reasoning, but it's definitely me inferring."

For a casual designer building a game for their nine-year-old, "player count scaling is too punitive at high counts" is enough. For an experienced designer planning a commercial release, the *reasoning* behind the critique is more valuable than the critique itself. The conclusion confirms what they already suspect. The evidence chain is what they need to make the right structural decision.

![Show Your Thinking: Critique Reasoning Chain]({{ site.baseurl }}images/nova-the-ai-co-designer/Nova_Show_Your_Thinking.jpg)

_Figure. An expanded critique reasoning chain. The conclusion is for quick scanning. The chain traces from observation through data and mechanism to impact. The decision buttons at the bottom let the designer choose the level of intervention: restructure the mechanism, or tune the numbers._

Nova's critique reasoning chains follow a structured format:

> **Conclusion**: The resource economy has structural imbalances around CPU costs and Focus token generation.
>
> **Reasoning Chain**:
> - **Observation**: The game uses three main resource types with different generation and consumption rates
> - **Data**: CPU costs range from 2-6, Focus generation is 2-3 per round, alarm escalation is +1/+2 per incident
> - **Mechanism**: Fixed hand size (6 cards) with exactly 3 programmed actions creates a constrained economy where CPU efficiency determines available options
> - **Impact**: Inefficient CPU ratios create dominant strategies around low-cost cards; insufficient Focus generation makes coordination failures inevitable rather than skillful
>
> **Approach**: [Restructure] [Tune Numbers]

![Nova Balance Analysis in GameGrammar]({{ site.baseurl }}images/nova-the-ai-co-designer/Nova_Screenshot_Balance_Analysis.jpg)

_Figure. Nova (Studio tier) analyzing the balance of Neural Race inside GameGrammar. The full reasoning chain, from observation through mechanism to impact, surfaces alongside decision levels and a version history trail of every Nova-applied change._

The conclusion is for quick scanning. The chain is for deep analysis. The approach buttons are for action. This mirrors how the best design conversations work in a professional studio: someone identifies the problem, explains why it is a problem, and presents the structural options for resolution. The lead designer chooses which level to intervene at.

Without the reasoning chain, you get one thing to react to. With it, you see the full decision tree. Do you redesign the round structure? Or do you just tune the draw rate? Those are fundamentally different design decisions at different levels of abstraction, and the lead designer is the one who should choose which level to operate at.

---

## The Architecture: Orchestration, Not Invention

Nova's power comes from unification, not from new AI capabilities. The same specialist agents that power GameGrammar's button-click interface also power Nova. The difference is the interaction model.

![Nova Architecture: Orchestration Layer]({{ site.baseurl }}images/nova-the-ai-co-designer/Nova_Architecture.jpg)

_Figure. Nova sits as a conversational orchestration layer on top of six specialist agents. The designer talks to Nova in natural language. Nova routes to the appropriate agent, collects structured results, and synthesizes them into a conversational response with change proposals and decision options._

Nova uses Claude's native tool-use capability to decide which agent to invoke. The designer's natural language is the input. Nova's system prompt includes tool definitions for all available agents: balance analysis, design intent resolution, consistency checking, section regeneration, design suggestions, and reference game search. Claude decides which tools to call based on the conversation context, the same way it decides which tools to use in any other agentic workflow.

This architecture has a crucial property: **the AI capabilities are already proven in production.** The BalanceCritic has been analyzing games for months. The DesignIntentResolver has been translating plain-language edits into ontology patches. Nova does not introduce new AI that might hallucinate in novel ways. It wraps trusted agents in a conversational interface with memory.

The agents run as tool calls within Nova's conversation loop. When the designer says "make this less punishing at four players," Nova does not try to solve the problem from first principles. It invokes the BalanceCritic to analyze the specific scaling issue, then invokes the DesignIntentResolver to translate the fix into a concrete ontology patch. The result is grounded in the same structural analysis that the button-click interface uses, but presented conversationally with reasoning.

**The zero-write principle still holds.** Nova proposes changes but never writes to the database without explicit designer approval. Every change proposal shows the exact path, old value, new value, and rationale. The designer clicks Apply or Dismiss. Applied changes go through the same version history system as manual edits, creating a traceable record. This is not a convenience feature. It is a constitutional principle: the AI never changes your design without your permission.

---

## Memory Without Replay

Nova remembers across sessions, but not by replaying raw conversations. That would be expensive and lossy. Instead, Nova reconstructs context from four structured sources:

| Source | What It Provides | Token Cost |
|--------|-----------------|------------|
| **Current ontology** | The game as it stands right now | ~1,500 |
| **Version history** | How the game got here (last 10 versions with change summaries) | ~300 |
| **Decision log** | What was accepted, rejected, and deferred (last 10 decisions) | ~500 |
| **Designer profile** | Who you are as a designer (only after 10+ decisions) | ~300 |

Total context per turn: approximately 3,000 tokens. At current API pricing, that is roughly $0.02 per turn, or $0.66 per 30-turn session.

The key insight is that Nova does not need the full conversation history. It needs: who the designer is (profile), what the game looks like right now (ontology), how it got here (version history), and what decisions were made (decision log). This keeps the context compact, cost-effective, and focused on the information that actually matters for the next response.

When the designer opens a new session, Nova assembles this context and generates a greeting that references the design's evolution:

> "Welcome back. Your game is at v7. Last session we settled on worker placement + deck building as the core loop and tuned the hand limit from 7 to 6. The current balance parameters show combo probability at 28%. You mentioned wanting to explore adding player interaction. Want to pick up there?"

The designer does not re-explain anything. The structured log plus the current ontology state is sufficient to reconstruct relevant context. This is cheaper, more reliable, and more useful than trying to replay and summarize old conversations.

---

## The Hallucination Problem, Solved Structurally

One of the persistent concerns about AI in creative tools is hallucination: the AI inventing facts, numbers, or relationships that do not exist. In a general chatbot, this is a real risk. You ask about your game, and the AI confabulates details.

Nova's architecture makes hallucination structurally difficult.

![Solving Hallucination Structurally]({{ site.baseurl }}images/nova-the-ai-co-designer/Nova_Hallucination_Shield.jpg)

_Figure. Four interlocking defenses against hallucination: concrete ontology, verifiable proposals, deterministic agents, and the zero-write principle._

First, Nova operates on a **concrete game ontology** [3], not general knowledge. When the designer asks "is my resource economy balanced?", Nova does not reason from general game design principles. It reads the actual ontology: the specific resource types, generation rates, consumption patterns, and player count scaling that exist in this design. The analysis is grounded in data, not guessing.

Second, every change proposal includes **the exact path, old value, and new value**. The designer can verify at a glance whether the AI is operating on real data or hallucinating. `balance_parameters.focus_per_round: "2-3 tokens" → "3-4 tokens"` is immediately checkable against the current design state.

Third, **the agents are deterministic in their inputs**. When Nova invokes BalanceCritic, it passes the full current ontology. The critic analyzes what is actually there, not what it imagines might be there. The reasoning chain traces from observable data to conclusions, creating an audit trail that the designer can verify.

Fourth, the **zero-write principle** means that even if the AI did hallucinate a recommendation, it cannot corrupt the design. The designer must explicitly approve every change. The version history preserves every previous state. Nothing is lost.

This is not a perfect guarantee against all forms of AI error. The agents might occasionally flag a non-issue or miss a real one. But the combination of grounded data, verifiable proposals, transparent reasoning, and explicit approval creates multiple layers of protection. The hallucination problem is not solved by making the AI smarter. It is solved by making the system's structure resistant to AI errors.

---

## Concluding Remarks

Nova transforms GameGrammar (Studio tier) from a design tool into a design partnership. The designer still provides the vision, the taste, the intention. The AI still provides the structural analysis, the mechanism knowledge, the rapid iteration. But the interface between them is no longer a set of buttons and forms. It is a conversation that accumulates context, learns preferences, explains its reasoning, and improves with use.

The reinforcement learning loop is what makes this different from "we added a chatbot to our product." Every accept/reject decision shapes the profile. The profile shapes future proposals. Better proposals produce more informative signals. The cycle compounds. After 50 decisions, Nova knows things about your design taste that you might not have articulated yourself. After 100, it starts proposing mechanism combinations that you would not have considered but that fit your aesthetic perfectly.

This is the new era of AI assistance. Not AI that generates and walks away. Not AI that waits passively for instructions. AI that works alongside you, session after session, building a shared understanding of what you are trying to create and how to get there.

The grammar does not write the poem [1]. But with Nova, the grammar remembers your voice.

---

### Series

* [Unlocking the Secrets of Tabletop Games Ontology (Part 4)]({{ site.baseurl }}unlocking-secrets-of-tabletop-games-ontology)
* [Introducing GameGrammar: AI-Powered Board Game Design (Part 5)]({{ site.baseurl }}introducing-gamegrammar-ai-powered-board-game-design)
* [GameGrammar: The Theory of Generative Board Game Design (Part 6)]({{ site.baseurl }}gamegrammar-the-theory-of-generative-board-game-design)
* **>>** [Nova: The AI Co-Designer That Learns Your Taste (Part 7)]({{ site.baseurl }}nova-the-ai-co-designer-that-learns-your-taste)

---

## References

[1] Alfred North Whitehead. [*Process and Reality*](https://archive.org/details/processreality00alfr). Free Press, 1929/1978.

[2] Benny Cheung. [*GameGrammar: The Theory of Generative Board Game Design*]({{ site.baseurl }}gamegrammar-the-theory-of-generative-board-game-design). bennycheung.github.io, Feb 2026.
  - The design theory that Nova builds upon: structured vocabulary, multi-agent generation, and the co-design partnership

[3] Benny Cheung. [*Generative Ontology: When Structured Knowledge Learns to Create*](https://arxiv.org/abs/2602.05636). arXiv:2602.05636, Feb 2026.
  - The formal paper describing GameGrammar's generative ontology framework

[4] [Dynamind Research](https://www.dynamindresearch.com). AI consulting and product development studio.
  - Creator of GameGrammar

[5] [GameGrammar](https://gamegrammar.dynamindresearch.com). AI-powered board game design platform.
  - The product where Nova lives: structured ontology, multi-agent generation, and conversational co-design

[6] Ethan Mollick. [*Co-Intelligence: Living and Working with AI*](https://www.amazon.ca/Audible-Co-Intelligence-Living-Working-AI/dp/B0CNFDMSYV). Penguin, 2024.
  - The framework for treating AI as a collaborative partner rather than a tool, central to Nova's design philosophy
