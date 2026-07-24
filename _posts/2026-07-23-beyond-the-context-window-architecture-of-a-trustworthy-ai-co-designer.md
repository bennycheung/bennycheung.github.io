---
layout: post
title: "Beyond the Context Window - The Architecture of a Trustworthy AI Co-Designer"
date: 2026-07-23 00:00:00.000000000 -00:00
permalink: beyond-the-context-window-architecture-of-a-trustworthy-ai-co-designer
author: Benny Cheung
artwork:
  author: Gemini 3 Pro
tags:
- Design Tools
- AI Engineering
- Context Engineering
- Co-Design
- Game Architecture
- LLM
- Production Systems
category: post
comments: true
image: images/beyond-the-context-window/post_cover.jpg
images:
  cover: images/beyond-the-context-window/cover2x.jpg
  header: images/beyond-the-context-window/header.jpg
published: true
series: "Game Architecture"
series_order: 10
featured: true
featured_order: 1
---

<!--excerpt.start-->
The industry talks about long-context AI as a capacity problem: bigger windows, stuff everything in, let the model sort it out. Building Nova, a persistent AI co-designer that works alongside board game designers across months of sessions, taught us the opposite. The bottleneck of a long-running collaborator is not how much context you can hold. It is the architecture around it: what to leave out, how to make the work survive an interruption, how to see what it costs, and how to stay correct when your own agent's output decays over time. This is the field report from that plumbing: the incidents that broke it, loud and quiet, and the disciplines they forced on us.
<!--excerpt.end-->

![Beyond the Context Window]({{ site.baseurl }}images/beyond-the-context-window/Beyond_Context_Window_Theme.jpg)

_Figure. A co-designer is not a bigger memory. It is a spine: the durable structure that lets a conversation survive interruptions, stay affordable, and keep its footing when the ground shifts._

## Where We Left Off

Back in [Nova: The AI Co-Designer That Learns Your Taste]({{ site.baseurl }}nova-the-ai-co-designer-that-learns-your-taste) [1], we described the dream: a conversational partner that remembers your decisions, learns your taste, explains its reasoning, and gets better the more you work together. The morning-standup collaborator that solo designers never had. We showed the reinforcement loop, the grounded proposals, the zero-write principle.

That post was about what the partnership *feels* like. This one is about what it *costs* to keep that promise once real designers start leaning on it, day after day, on designs that grow past a hundred kilobytes, across app deploys and dropped connections and a shared budget that can hit zero.

We shipped the co-designer. Then production happened. What follows is the honest sequel: the gap between an AI collaborator that demos well and one you can actually rely on, and why closing that gap has almost nothing to do with the size of the context window.

---

## The Myth of the Bigger Window

Open any discussion of "context engineering" right now and you will find the same reflex: the frontier is *capacity*. Million-token windows. Retrieval that stuffs more documents into the prompt. The implicit promise is that if you can just hold enough context, the hard problems dissolve.

For a one-shot chat, that reflex is fine. For a *persistent* collaborator, it is the wrong instinct, and an expensive one.

The reason is simple and easy to miss in a demo. In a real partnership, the same context is not sent once. It is re-sent thousands of times, on every turn of a months-long relationship, and each of those turns is a multi-minute operation running against infrastructure that was never built to wait multiple minutes. Capacity is the property you notice first and the constraint that matters least. What decides whether the partnership holds up is a set of much less glamorous questions:

- What can I *leave out* of this call without breaking it?
- What happens to the work when the connection drops, the process restarts, or the user walks away mid-run?
- Can I *see* what this collaboration is costing before the bill arrives?
- What happens to my data after the AI has been writing into it, imperfectly, for three months?

None of those are answered by a bigger window. Every one of them nearly took Nova down. Here is how.

---

## Three Ways a Co-Designer Breaks in Production

Nova is a conversational layer over a multi-agent pipeline: specialist agents, a structured game ontology, a reference library, and a persistent memory of your decisions. The AI capabilities were proven. The *durability* of the collaboration was not, and it failed in three distinct ways within a few weeks of heavy real use.

![Three production incidents, one shared shape]({{ site.baseurl }}images/beyond-the-context-window/Three_Incidents_One_Shape.jpg)

_Figure. Three incidents that look unrelated on the surface — playtests dying, generation failing, an account draining overnight — and share one root shape: a multi-minute AI operation coupled to something that was never built to live for multiple minutes, priced by something that could not see what it cost._

| Incident | Surface | What actually happened |
|---|---|---|
| Playtests "just die" | Simulation streamed inside a chat response | The edge proxy severs a streamed connection after about 100 seconds of quiet. A cold rules-parse alone runs about 75 seconds. The result lived only in the stream, so when the stream died, the result was gone, with no record it had ever run. |
| Generation "keeps failing" | Design generation as a background task | Job state lived in an in-memory dictionary inside the API process. Every deploy restarts that process. Three deploys in one day meant zero successful generations, fleet-wide, and the client just hung. |
| The account drains overnight | Conversational editing | One engaged user, inside every configured limit, ran a single long session that emptied the platform's shared AI account and took generation down for the entire beta the next morning. |

Three incidents, but they trace to three distinct failure modes. The dying playtests and the failing generations are one and the same: the Leash. Wired underneath them, and the reason the edits kept timing out too, is a second that is a cause more than an event: the Time Bomb. And the overnight drain is a third: the Invisible Bill.

### The Leash

The first two incidents are the same mistake wearing different clothes. A playtest simulation and a design generation are both multi-minute AI operations. In both cases, the *durability of the work* was tied to the *lifetime of a connection or a process*.

There are three such leashes in a typical stack, and our early code used all three: the client connection (browser through the edge proxy to the server), the process memory (state in a dictionary in the API container), and the request task itself (a long call awaited inside a request handler). A connection can drop. A process can restart on deploy. A request can be cancelled when the client disconnects. None of them is a safe place to store "is this multi-minute job still alive, and what is its result."

The critical realization was that these were not three bugs. They were three faces of one architectural error. And the only component in the whole stack built to outlive connections, requests, and deploys is the database.

### The Time Bomb

The Time Bomb is subtler, less a standalone incident than the cause running under the other two, and it is the one that indicts the bigger-window instinct directly.

Every one of Nova's agent calls serialized the *entire* game ontology into the prompt. A one-line rule change re-sent the whole design. That makes each operation scale with the *size of the design* instead of the *size of the edit*, when it should be the other way around. On a 69 KB design that is roughly 17,000 input tokens on every single call. On a larger design in the wild it was 134 KB.

This is not just a cost problem. It is a *latency* problem, and the two are the same root cause. A bigger prompt means more tokens to ingest, slower time-to-first-token, longer completion, and therefore a call that drifts closer to and then past the timeout ceilings that caused the Leash. Successful runs were already sitting right at the 100-second edge. As designs grow, *every* design eventually tips over that line. Context bloat was not a separate issue from the timeouts. It was a latency multiplier actively pushing work off the cliff.

The bigger-window reflex says hold more. We learned to do the opposite. The whole design was in the prompt, and that was the bug.

### The Invisible Bill

The Leash was about work that died. The Time Bomb was about work that grew too heavy and slow to finish. The third failure was different in kind: the work ran perfectly. What broke was that nobody could see what it cost until it was already gone.

Then the account drained.

Nova traffic one day ran about ten times normal. Digging into it, the vast majority of it came from a single account, most of it in one long, unbroken session. The cadence was steady and human, a few minutes between messages. This was not a runaway loop or an abuse case. It was legitimate heavy use, a *good* user, the product working exactly as intended.

Where did the money go? Forty-four `modify_design` calls, each a reasoning pass over the whole ontology, roughly 18,000 input tokens apiece, plus the orchestrator loop wrapped around each one re-sending a large, stable prefix on every iteration with no caching at all. The playtests, widely assumed to be the expensive part, cost about two cents each and were negligible.

The ceiling that was supposed to prevent this counted *messages*, not *cost*. The account ran right up near the message cap without ever tripping it. But per-message cost spans a 30-to-50x range depending on design size, tool fan-out, and loop depth, and the cap saw none of that. It was a rate limiter pretending to be a budget. Worse, the conversational surface, by far the most token-intensive part of the system, was not metered against the credit ledger *at all*. Across a full day of heavy traffic, there were zero credit transactions.

A good user, staying inside every configured limit, drained a shared resource because the system could not see what the collaboration cost. You cannot build a trustworthy long-running partner on a bill you cannot read.

---

These were not a to-do list of bugs. Each failure pointed at a discipline the first design had skipped, and the fix in every case was structural rather than a smarter prompt. Here are the four, in the order the incidents forced them on us.

## Discipline 1: Cut the Leash

The fix for the Leash is not a longer or stronger leash. It is to cut it.

Picture it from the designer's chair. You ask Nova to run a two-hundred-game playtest on your worker-placement prototype, watch it kick off, then close the laptop and go make dinner. Before this change, that run was pinned to your open connection: the moment the tab slept or the wifi blinked, it died mid-stream and left nothing behind, not even a record that it had started. After, the run is written to the database the instant it begins. You reopen the tab an hour later and the findings are simply waiting, or, if a deploy happened to interrupt it, a clean "interrupted, run again" rather than a spinner that never resolves. The work stopped depending on you staying present for it.

![Durable jobs: work lives in the database]({{ site.baseurl }}images/beyond-the-context-window/Durable_Jobs.jpg)

_Figure. Before: the result lives in the stream or an in-process dictionary, and dies with the connection or the deploy. After: a status row is created in the database before the work starts, a background worker updates it, and the client polls a cheap endpoint. Streaming is demoted from the source of truth to a progress hint._

Any AI operation expected to run long becomes a database-backed job. A status row is created *before* the work begins. A worker updates progress on the row. The client sends a start request that returns in milliseconds with a job id, then polls a cheap sub-second endpoint. Streaming stays, but only as a progress *enhancement*, never as the thing that holds the result.

The inversion is the whole point: **today streaming *is* the source of truth, so missing the stream loses the result; the fix makes the database row the source of truth, and demotes streaming to a hint.** Everything good follows from that one change:

- The 100-second edge ceiling stops being reachable at all. There is no long-lived idle connection for the proxy to cut. The ceiling is not worked around with heartbeats, it is removed from the topology.
- Deploy restarts stop losing state. The row survives the container swap. Even if the worker is killed mid-run, the *record* remains, so a deadline reaper flips a stale run to "failed" and the client's next poll gets a clean, retryable "interrupted, please retry" instead of hanging forever.
- Failures stop being invisible. Because the row exists before the work starts, every attempt leaves a durable trace, regardless of outcome. The entire "died with no record" class that made these incidents so hard to diagnose simply ends.

We did not invent this. An earlier comparison feature already used exactly this row-and-reaper pattern in production. The work here was extracting it into a shared service and applying it to the surfaces that still ran on a leash. That is the unglamorous truth of most reliability engineering: the clever part is recognizing that three unrelated-looking failures are one shape, and refusing to patch them three times.

---

## Discipline 2: Send Less, Not More

The Time Bomb is where a persistent collaborator forces you to unlearn the bigger-window instinct completely.

An LLM editing one mechanism does not need to *read* the other mechanisms, the components, and the scoring formulas. It needs two things: the target subtree it is editing, and enough awareness of *what else exists* to avoid creating a dangling reference. That second part is cheap. Our ontology layer already computes the lists of declared mechanism names, resource names, and card types.

![Scoped context: the funnel]({{ site.baseurl }}images/beyond-the-context-window/Scoped_Context_Funnel.jpg)

_Figure. A deterministic selector maps the edit to the sections it touches, follows the dependency closure, and always unions a small structural spine. The full 69 KB ontology (about 17,000 tokens) becomes a 5-to-15 KB payload: the target subtree, a compact registry summary of what else exists, and an index of the sections not shown._

So instead of the whole design, a scoped call sends the target subtree, a compact summary of the registry, and a short index that says "these other sections exist but are not shown." On a large design, a one-phase rename that used to send about 18,000 tokens now sends 4,304, a 76% cut, measured against real telemetry, and it produces a correct patch with valid paths into the full design.

This is the direct counter-narrative to "just use a bigger window." The scaling win came from deciding, deterministically and per edit, what the model was allowed to *not* see. Selectivity, not capacity, was the lever.

The instinct to send everything feels safe, but it is the expensive kind of safe: every edit slower, pricier, and closer to the cliff, forever. On a long-running collaborator, sending less is what keeps the whole thing viable.

---

## Discipline 3: Verify the Whole, Even When the Model Sees a Part

Discipline 2 invites an obvious objection, and the answer to it is the thing I most want you to take from this piece.

If the model only sees one subtree, what stops a scoped edit from breaking something outside its view, referencing a mechanism it could not see, orphaning a resource, contradicting a rule in a section it never read?

The answer is that **scoping narrows what the model *reads*, never what the system *validates against*.** The semantic validator, the safety net that checks for phantom references and structural contradictions, runs on the *full* post-edit design, exactly as it did when the model saw everything. The model's view got smaller. The system's guarantee did not move an inch.

This is what makes aggressive context reduction *safe* rather than reckless. You can afford to give the model less precisely because your correctness guarantee does not depend on the model having seen everything. It depends on an independent check against the whole truth. When a scoped edit does reach for something outside its view, the validator catches it just as it always would, and a confidence gate falls back to the full design for genuinely cross-cutting intents.

The general principle, well beyond board games: **trim the view, validate the whole.** The trust in a long-running AI collaborator cannot come from the model's diligence, because the model is working from a partial picture by design. It has to come from a verification layer that sees the complete state and is independent of what the model was shown. Get that separation right and you can be as stingy with context as you like.

---

## Discipline 4: Meter What You Can't See

The Invisible Bill was never going to be fixed by a smarter prompt. It was a measurement failure, and measurement failures are fixed by instrumentation, then by turning that instrumentation into a real budget.

![From a message count to a cost budget]({{ site.baseurl }}images/beyond-the-context-window/Token_To_Credit_Budget.jpg)

_Figure. Every turn's real token usage — input, output, and separately the cheap cached reads and the pricier cache writes — is priced at provider rates, converted to a single credit unit anchored at roughly one cent of real cost, and gated against a per-user budget. A message count that was blind to a 30-to-50x cost range becomes a real ceiling that sees the actual money._

Three moves, in order:

**See it.** We added per-call telemetry to every AI call site: input and output tokens, cache reads and writes, latency, which surface, how big the design was. Before this, the conversational surface computed its own token totals and then only wrote them to a log line. The cost of the most expensive part of the product was un-queryable until the account hit zero. Now every turn leaves a priced, queryable record.

**Make the repeats cheap.** The single largest waste in the drain was the orchestrator loop re-sending a large, stable prefix on every iteration with no caching. Provider-side prompt caching serves that stable prefix from cache on the repeated calls at roughly a tenth of the price, with zero change to the model's behavior. Since that prefix was most of what each loop iteration re-sent, caching took a large bite out of the cost of every tool-using turn. It was the highest cost-cut-per-unit-effort of anything we did, and not a model change at all, just refusing to pay full price for the same tokens twice.

**Turn it into a budget.** Each turn is now priced from its real measured tokens and debited against a per-user credit budget, the same ledger that already governed generation. The formula rewards caching automatically, since a cached read is billed at a tenth of a fresh token, so a warm follow-up turn costs a single credit while a cold reasoning pass costs several. The ceiling finally sees the money. The usage that drained the account now hits a per-user daily budget after a session or two, and total platform exposure becomes a bounded, known number instead of an open tap.

The goal was never to throttle the good user. Because caching and scoping had already cut per-turn cost substantially, far *more* engagement now fits under the same budget than during the incident. A budget like this does not punish depth; it makes going deep *affordable and bounded* instead of silently catastrophic.

And measurement, once you have it, keeps paying off. We are currently running a live experiment: extending the cache lifetime from about five minutes to a full hour, on the theory that a designer who edits, thinks for fifteen minutes, then edits again should not pay a cold-cache penalty for the pause. The five-minute baseline is 44% cold turns at about 7.4 cents per turn. Whether the one-hour window is a win is not something to guess or assume from a vendor's docs. It is something the telemetry will tell us, against a baseline we captured first. That is the difference between engineering the cost of a collaboration and hoping for it.

---

## Persistence Accumulates Entropy

The first three failures broke loudly, and within weeks. There is a fourth that only a *persistent* collaborator suffers, and it breaks the opposite way: quietly, months after the damage is done. We hit it while writing this very post.

A user reported that one design's critique view showed "part of this design's data is in an unexpected format," and that the consistency-fix step was failing. The cause, traced through the live data, was a single `null` value sitting in the middle of an array where the AI had written it, months earlier, during some ordinary editing session. The rendering code mapped over that array and read a field off the `null`, threw, and blanked the entire view. A second code path validated the same issues and rejected them all because one was malformed. One stray value the agent produced, poisoning two features long after it was written.

This is the tax of persistence. A stateless chatbot starts clean every session. A collaborator that writes into a durable, growing document *accumulates the consequences of its own imperfect output over time.* No matter how good the agent's write path is, over months it will occasionally produce something slightly malformed, and that artifact will outlive the session that created it.

So the architecture has to be resilient to its own collaborator. The fix was defensive by construction: the view now filters out malformed entries and coerces every field to something safe to render, so a bad value degrades one item instead of destroying the whole tab. The apply path now tolerates the same content arriving under a slightly different field name instead of rejecting it. And the rejection now logs *why*, because the original failure had slipped through a gap in the telemetry and left no trace, the Invisible Bill lesson, in miniature, all over again.

The mindset shift is what matters: treat your own AI's historical output as untrusted input. This is not a judgment on the agent, just arithmetic. Over a large enough body of machine-written data, some fraction will be malformed, and a trustworthy system stays standing when it hits that fraction.

---

## What "Trustworthy" Actually Means

Put the four disciplines together with the tax of persistence, and a working definition of a trustworthy co-designer falls out. It has little to do with the size of its memory and everything to do with four properties of the system around it:

- **Durable** — the work survives interruptions, deploys, and dropped connections, because its state lives somewhere built to outlive them.
- **Affordable** — you can lean on it all day, because the cost of each turn is measured, cached, and bounded by a budget that can see the money.
- **Grounded** — its edits are verified against the complete truth, independently of the partial view it was given, so you can safely feed it less.
- **Resilient** — it stays standing when it hits its own accumulated mistakes, because the system treats machine-written history as an untrusted input.

![The four pillars of a trustworthy co-designer]({{ site.baseurl }}images/beyond-the-context-window/What_Trustworthy_Means.jpg)

_Figure. The co-designer stands on four pillars: durable (the work survives interruptions and deploys), affordable (its cost is measured and bounded), grounded (its edits are verified against the whole truth), and resilient (it withstands even its own accumulated mistakes). The intelligence is the figure; the trust is the structure beneath it._

None of these is a model capability; each is a property of the system *around* the model. The Nova post was about the intelligence of the partner. This one is about the spine that lets you depend on it, and the spine is where the engineering lives.

---

## The Real Bottleneck

The abstract conversation about long-context AI is having the wrong argument. It treats the frontier as capacity, as if the next larger window is what unlocks the reliable, months-long AI collaborator.

The lived experience says the bottleneck is somewhere else entirely. It is architectural discipline: cutting the leash so the work survives, sending less instead of more, verifying the whole while showing the model a part, and metering what you otherwise cannot see. Reaching for a bigger window is the answer you give before you have run one of these in production. The real work is quieter: deciding, per operation, what the model does *not* need, and building the durable, observable, self-correcting structure underneath it. That structure is the difference between a demo you admire and a partner you lean your weight on.

To be honest about the limits: this is a field report from a beta, not a solved problem. Some long operations still survive a deploy only as a clean retry rather than continuing to completion, which needs a dedicated worker we have not built yet. Long-session compaction is deferred. Getting the pricing to durably reward that cheaper cost is an experiment still running. None of it is finished. But the shape of the answer is already clear, and it is not the one the bigger-window story would predict.

In the first Nova article we ended on a line: the grammar does not write the poem, but with Nova the grammar remembers your voice. Here is the sequel to that promise, learned the hard way in production:

*A co-designer you can trust is not the one with the largest memory. It is the one whose memory you can afford, survive, and verify.*

---

### Series

* [Nova: The AI Co-Designer That Learns Your Taste (Part 7)]({{ site.baseurl }}nova-the-ai-co-designer-that-learns-your-taste)
* [Generative Ontology: From Game Knowledge to Game Creation (Part 8)]({{ site.baseurl }}generative-ontology-from-game-knowledge-to-game-creation)
* [AI Playtesting: When Your Board Game Tests Itself (Part 9)]({{ site.baseurl }}ai-playtesting-when-your-game-tests-itself)
* **>>** [Beyond the Context Window: The Architecture of a Trustworthy AI Co-Designer (Part 10)]({{ site.baseurl }}beyond-the-context-window-architecture-of-a-trustworthy-ai-co-designer)

---

## References

[1] Benny Cheung. [*Nova: The AI Co-Designer That Learns Your Taste*]({{ site.baseurl }}nova-the-ai-co-designer-that-learns-your-taste). bennycheung.github.io, Feb 2026.
  - The introduction to Nova as a conversational co-designer: the reinforcement loop, grounded proposals, and the zero-write principle this article builds on.

[2] Benny Cheung. [*Generative Ontology: When Structured Knowledge Learns to Create*](https://arxiv.org/abs/2602.05636). arXiv:2602.05636, Feb 2026.
  - The formal framework behind the structured game ontology that makes independent, full-state validation possible.

[3] Ethan Mollick. [*Co-Intelligence: Living and Working with AI*](https://www.penguinrandomhouse.com/books/741805/co-intelligence-by-ethan-mollick/). Penguin, 2024.
  - Treating AI as a collaborative partner rather than a tool, the framing at the center of the Nova series.

[4] Anthropic. [*Prompt caching*](https://docs.anthropic.com/en/docs/build-with-claude/prompt-caching).
  - The provider-side caching mechanism used to make the repeated stable prefix of a long conversation cheap without changing model behavior.

[5] [GameGrammar](https://gamegrammar.dynamindresearch.com). Board game design platform.
  - Where Nova lives: structured ontology, multi-agent generation, and conversational co-design.
