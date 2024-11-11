---
layout: post
title: Seeing Logic - The Power of Existential Graphs and Visual Thinking
date: 2024-11-10 12:00:00.000000000 -00:00
permalink: seeing-logic-with-existential-graphs
author: Benny Cheung
artwork:
  author: DALLE-3
tags:
- Philosophy
- Knowledge Graph
- AI
- AI Education
category: post
comments: true
image: images/seeing-logic-with-existential-graphs/post_cover.jpg
images:
  cover: images/seeing-logic-with-existential-graphs/cover2x.jpg
  header: images/seeing-logic-with-existential-graphs/header.jpg
published: true 
---

<!--excerpt.start-->
Logic is inherently challenging—not only difficult to get right, but often tough to even grasp. Abstract concepts do not come naturally to most people, which is why visual logic can be transformative. Visual logic makes logic visible, bridging the gap between abstract reasoning and intuitive understanding. When logic is represented visually, we begin to comprehend it in a more intuitive way, similar to how we understand physical objects like chairs or doors. This matters because understanding logic is not just a niche skill for mathematicians or computer scientists; it is fundamental to how we perceive and interact with the world.
<!--excerpt.end-->

![Cycle of Visual Logic Understanding]({{ site.baseurl }}images/seeing-logic-with-existential-graphs/EG_01_Cycle_of_Visual_Logic_Understanding.png)

*Figure. This cycle emphasizes the power of visual logic in making abstract ideas more accessible and intuitive.*

## Charles Sanders Peirce and Existential Graphs

The idea of visualizing logic is not new. In the 19th century, [Charles Sanders Peirce](https://plato.stanford.edu/entries/peirce/), a philosopher and logician, sought to make abstract ideas concrete. He developed a system called **existential graphs**, which were diagrams that depicted logical relationships in a visual format. By drawing logic on a blank piece of paper, Peirce aimed to transform logic into something visible, making abstract relationships tangible and accessible. For example, drawing a circle around a statement indicated its negation—"not that." This simple visual representation allowed individuals to see logical operations rather than solely interpret symbols mentally.

![Peirce's Existential Graphs]({{ site.baseurl }}images/seeing-logic-with-existential-graphs/EG_02_Peirce_Logic_Introduction.png)

*Figure. Developed by Peirce, existential graphs allow abstract concepts to be represented concretely through visualization of logic.*

Peirce's existential graphs provided a way to represent logical statements visually. For instance, to express "the sky is not blue," one would write "the sky is blue" inside a circle, with the circle representing negation. This visual approach made abstract logic concrete, allowing individuals to see logical operations rather than interpret abstract symbols mentally.

Although it may seem obvious in retrospect, Peirce's approach was innovative for his time. By representing logic visually, he demonstrated that abstract concepts could become more intuitive when made visible. His existential graphs transformed the invisible workings of logic into tangible diagrams that the brain could readily comprehend.

Peirce emphasized the power of _iconic representations_, where the structure of a symbol resembles the concept it represents, making it intuitively easier to understand. Existential graphs embody this principle by structuring logical statements in a visual format, using different types of graphs to represent various levels of logic.

### Alpha Graphs: Visualizing Propositional Logic

Alpha graphs are the simplest form within Peirce’s existential graph system, corresponding to **propositional logic**. In propositional logic, statements are treated as simple units (propositions) that can be combined using logical operations like "and," "or," and "not," without reference to specific entities or variables. Alpha graphs visually represent these statements and their combinations using straightforward conventions:

- **Letters or symbols** represent individual propositions.
- **Enclosures called "cuts"** are used to represent negation. Placing a proposition within a cut negates that proposition, analogous to a "not" in traditional symbolic logic.

For example, consider the statement "It is not raining." In an Alpha graph, the proposition "It is raining" would be written, and a cut (a closed curve) would be drawn around it to indicate negation.

![Alpha Graph Notation]({{ site.baseurl }}images/seeing-logic-with-existential-graphs/EG_Alpha_Graph.jpg)

*Figure. This diagram illustrates Peirce’s Alpha Graph notation, which represents propositional logic in a graphical format. The left column shows common logical statements in English, the middle column (F) displays their representation in traditional symbolic logic, and the right column (EG) demonstrates how each statement is expressed in Alpha Graphs.*

By using Alpha graphs, Peirce provided a way to visualize basic logical operations without the need for textual or symbolic manipulation, allowing users to "see" the relationships between propositions. This makes Alpha graphs an iconic and intuitive way to represent propositional logic.

### Beta Graphs: Extending to Predicate Logic

Building upon Alpha graphs, Beta graphs incorporate **predicate logic** (also known as first-order logic), which introduces variables and relationships between objects. Predicate logic allows for more complex statements involving individual entities and their properties or relationships, such as "All humans are mortal" or "Socrates is a human." In Beta graphs, Peirce introduced additional features:

- **Lines of identity** represent specific individuals or objects, connecting parts of the graph to indicate that two propositions refer to the same entity.
- **Predicates and quantifiers** allow expressions like "some" or "all" to be represented graphically, enabling the graphs to capture relationships between different variables or individuals.

![EG notation explained 1911]({{ site.baseurl }}images/seeing-logic-with-existential-graphs/EG_notation_explained_1911.png)

_Figure. source: John F. Sowa, [Existential Graphs - The simplest notation for logic ever invented](https://jfsowa.com/talks/egintro.pdf), 10 Jan 2020._

Here are some examples:

1. **Basic Existence and Relationships**:

   - **Statement**: "A cat is on a mat."
   - **Representation**: The words "Cat," "On," and "Mat" are connected by lines, forming a simple diagram where "Cat" is linked to "Mat" through the relation "On."
   - **Explanation**: This visually represents the existence of a cat and its relation to the mat.

2. **Existential Statement**:

   - **Statement**: "Something is under a mat."
   - **Representation**: A line connects "Under" to "Mat," without specifying what is under the mat.
   - **Explanation**: This denotes that there exists something under the mat, aligning with the existential quantifier in predicate logic.

3. **Negation**:

   - **Statement**: "Some cat is not on a mat."
   - **Representation**: The relation "Cat On Mat" is enclosed within a cut to signify negation.
   - **Explanation**: This indicates that there exists a cat that is not on a mat.

4. **Conditional Statements**:

   - **Statement**: "If a cat is on a mat, then it is a happy pet."
   - **Representation**: The antecedent "Cat On Mat" is enclosed within a cut, leading to the consequent "Pet Happy."
   - **Explanation**: The enclosing cut signifies that if the condition is met (a cat is on a mat), then the result or consequence (the cat is a happy pet) follows.

![Beta Graph Examples]({{ site.baseurl }}images/seeing-logic-with-existential-graphs/EG_Beta_Graph_Existential_Quantifier.png)

*Figure. This diagram shows how existential and universal quantifiers are represented in Peirce’s Beta Graphs, a part of his Existential Graph system for predicate logic.*

By using these visual conventions, Beta graphs enable the representation of complex logical structures, including negations, existential quantifiers, and conditionals, in a graphical format. This system allows users to visualize logical relationships without relying solely on symbolic notation, making logical inference and relationships more intuitive.

### Connecting Existential Graphs to Modern Knowledge Graphs

Peirce's emphasis on interconnectedness in his graphs suggests that propositions are inherently relational and form a network of meanings. This approach mirrors the structure of modern knowledge graphs, where meaning is derived from the web of relationships between entities. Knowledge graphs, such as those used in search engines or AI applications, represent information through nodes and edges, much like Peirce's existential graphs.

For example, platforms like **Neo4j** utilize graph databases to store and query data in a way that reflects relationships between entities. These tools employ visual logic to model complex data structures, making abstract concepts more tangible and accessible. By representing data visually, users can better understand and navigate complex networks of information.

Peirce's work has influenced fields like artificial intelligence and cognitive psychology, inspiring early semantic networks and researchers such as John F. Sowa. Sowa's conceptual graphs, a precursor to semantic networks, reflect Peirce's visual logic and have contributed to the development of knowledge representation in AI.

By extending from Alpha graphs to Beta graphs, Peirce demonstrated how visual logic could represent increasingly complex logical structures. Together, these systems illustrate the power of visual logic in making abstract concepts more accessible and intuitive, laying the groundwork for modern applications in knowledge representation and artificial intelligence.

## The Human Brain: Wired for Visual Understanding

### Evolutionary Roots of Visual Thinking

Our capacity for visual thinking is deeply rooted in our evolutionary history, giving us an innate advantage in processing visual information. Humans evolved to understand the world visually; we did not evolve to read strings of symbols or lines of text. The human visual cortex is significantly larger compared to that of other primates, indicating an enhanced capacity for processing complex visual information. This expansion has contributed to advanced cognitive functions, including language and abstract thinking.

For example, when walking through a forest and seeing a stick that resembles a snake, the brain quickly interprets the visual pattern, prompting an immediate response. This rapid visual processing underscores how our brains are wired to detect patterns, understand shapes, and perceive relationships between objects.

### Applications of Visual Understanding

Visual representations are effective tools for learning and comprehension across various domains. For instance, when learning about how electricity flows in a circuit, a diagram with a battery, wires, and a light bulb allows individuals to visualize how current flows and how components connect, making the concept more graspable than abstract equations alone.

Similarly, explaining a family tree through a diagram enables immediate understanding of relationships that would be cumbersome to convey through text alone. Visual logic leverages this natural aptitude for visual processing, making abstract reasoning more concrete.

The **Picture Superiority Effect** is a well-documented phenomenon in cognitive psychology, indicating that individuals remember images more effectively than words. Studies have shown that people can recall images with high accuracy even after brief exposure, highlighting the power of visual memory. In educational settings, visual aids such as diagrams and charts enhance learning by making complex information more accessible and engaging.

By applying visual logic, abstract concepts become tangible, bridging the gap between complex ideas and intuitive understanding. This approach aligns with how the human brain naturally processes information, facilitating better comprehension and retention.

## Embracing the Complexity: The Messiness of Visual Logic

While Peirce's work on existential graphs was innovative, it did not gain immediate widespread adoption, partly because visual logic can appear messy and complex. Traditional symbolic logic presents formulas that stay neatly in place, whereas visual logic involves drawing and connecting elements, which can resemble intricate webs.

However, this complexity can be a feature rather than a drawback. The "messiness" of visual logic reflects the true nature of real-world problems, which are often complex and interconnected. Being able to see the full picture, with all its nuances and relationships, can lead to deeper understanding and new insights.

For example, mind maps are a form of visual logic that embrace complexity. When brainstorming ideas or planning projects, individuals often create mind maps that branch out in multiple directions. Although these diagrams can look chaotic, they allow for the exploration of connections between concepts that might not be apparent in a linear format. This visual exploration can lead to breakthroughs and innovative solutions that linear thinking might overlook.

By embracing the inherent complexity in visual logic, we can better navigate complex systems and appreciate the interconnectedness of ideas, ultimately enhancing problem-solving and creative thinking.

## Visual Logic in Education

The potential benefits of visual logic are substantial, especially in education. Abstract concepts can be challenging for students to grasp when presented solely through text or symbolic notation. By making logic concrete and visual, we can enhance comprehension and engagement.

![Making Logic Accessible]({{ site.baseurl }}images/seeing-logic-with-existential-graphs/EG_03_Making_Logic_Accessable.png)

*Figure. Different visual tools that make logic more accessible and engaging, including classroom scenarios, visual puzzles, cards, and diagrams.*

Imagine a classroom where students solve logical puzzles represented visually, using cards and diagrams instead of symbols on a chalkboard. Teachers could present scenarios visually, such as showing the flow of electricity in a circuit or mapping out the relationships in a story. By manipulating visual elements, students can intuitively understand logical operations like negation or conjunction.

For example, in computer science education, visual logic diagrams can help students understand how algorithms work. Flowcharts visually represent the steps in an algorithm, making it easier to follow the logic and identify potential issues.

Similarly, when troubleshooting a computer network, visualizing the network's layout can help identify where connections are failing. Network diagrams display routers, switches, and connections, allowing technicians to see the relationships between components and isolate problems more efficiently.

By integrating visual logic into education, abstract reasoning becomes more accessible, fostering critical thinking skills across disciplines.

## Standardizing Visual Language

One of the challenges of visual logic is establishing a common visual language. If individuals draw their existential graphs differently, the communication becomes less effective. However, this issue is solvable through standardization, allowing for shared understanding while preserving the benefits of visual thinking.

Throughout history, various visual languages have been developed to represent logic, mathematical relationships, or complex systems. Here are some prominent examples:

| Visual Language                     | Developer(s)                                         | Purpose                                                     | Common Usage                                                        |
| ----------------------------------- | ---------------------------------------------------- | ----------------------------------------------------------- | ------------------------------------------------------------------- |
| **Venn Diagrams**                   | John Venn (1880)                                     | Represent set theory and logical relationships              | Widely used in set theory, probability, and logic visualization     |
| **Euler Diagrams**                  | Leonhard Euler (18th century)                        | Show subset relationships                                   | Visualize hierarchical data and relationships                       |
| **Flowcharts and Block Diagrams**   | Engineers, programmers (1940s-50s)                   | Represent processes, workflows, or algorithms               | Modeling business processes, programming, engineering workflows     |
| **Conceptual Graphs**               | John F. Sowa (1970s)                                 | Represent complex relationships in knowledge representation | Used in AI and knowledge representation                             |
| **Unified Modeling Language (UML)** | Grady Booch, Ivar Jacobson, James Rumbaugh (1990s)   | Model object-oriented software                              | Software engineering to model system architecture and interactions  |
| **Petri Nets**                      | Carl Adam Petri (1962)                               | Model distributed systems and parallel processes            | Analyzing concurrent events in systems and computer science         |
| **Semantic Networks**               | Various, psychology and computer science (1960s-70s) | Represent knowledge networks                                | Foundational in AI, linguistics, and knowledge representation       |
| **Truth Tables and Karnaugh Maps**  | Various                                              | Display and simplify Boolean logic outcomes and expressions | Digital logic design, circuit minimization, and logic demonstration |
| **Mind Maps and Concept Maps**      | Joseph D. Novak (1970s)                              | Organize associative and hierarchical ideas                 | Education, brainstorming, knowledge organization                    |
| **System Dynamics Diagrams**        | Jay Forrester et al. (1960s)                         | Model feedback loops and accumulations in systems           | Economics, ecology, business for dynamic systems modeling           |
| **Argument Maps**                   | Various, critical thinking educators                 | Visualize argument structures with premises and conclusions | Education, critical thinking, logical analysis                      |

These visual languages illustrate humanity's ongoing effort to make complex systems understandable, each contributing to a richer landscape of visual representation. They are widely adopted across scientific, educational, and business contexts, demonstrating the effectiveness of visual tools in simplifying complexity and enhancing comprehension.

![Expressing "A Cat Is on a Mat"]({{ site.baseurl }}images/seeing-logic-with-existential-graphs/EG_How_to_say_cat_is_on_a_mat.png)

*Figure. Various methods developed over time to express the simple statement, “A cat is on a mat,” in formal logic. This shows representations from Gottlob Frege (1879), Charles Sanders Peirce (1885), Giuseppe Peano (1895), Peirce’s Existential Graph (1897), Conceptual Graphs (1976), and the CLIP dialect of Common Logic.*

By adopting standardized visual languages, we enable clearer communication and collaboration across disciplines, much like how musical notation allows musicians to play the same piece despite different backgrounds.

## The Role of AI in Advancing Visual Logic

Artificial intelligence (AI), with its proficiency in pattern recognition and system translation, has the potential to revolutionize visual logic, making abstract concepts more accessible than ever. AI can assist in generating visual representations of logical statements, translating traditional symbolic logic into visual formats that are easier to comprehend.

![AI's Role in Visual Logic]({{ site.baseurl }}images/seeing-logic-with-existential-graphs/EG_04_AI_Role_in_Visual_Logic.png)

*Figure. Summarizes AI’s role in enhancing visual logic by supporting various aspects of learning and representation.*

For example, modern AI tools like **Neo4j**, a graph database platform, enable users to visualize and query complex relationships in data. By representing data as nodes and edges in a graph, Neo4j allows for intuitive exploration of connections, facilitating tasks such as fraud detection, recommendation systems, and knowledge management.

Similarly, AI-powered visualization software can help professionals in various fields create interactive diagrams and models. Tools like Microsoft's **Power BI** or **Tableau** use AI to generate visualizations from data sets, helping users identify patterns and insights that might be overlooked in raw data.

In education, AI can support students in learning logic by providing interactive visualizations and adaptive learning experiences. AI tutors can guide students through logical problems, offering visual aids and personalized feedback to enhance understanding.

By integrating AI with visual logic, we can harness technology to bridge the gap between abstract reasoning and intuitive understanding, empowering individuals to navigate complex information more effectively.

## Visual Logic Beyond Education

The applications of visual logic extend beyond education, offering significant benefits in various sectors such as business, technology, and everyday communication. Visual logic can transform how we present and interpret complex information, leading to improved understanding and decision-making.

![Visual Logic Beyond Education]({{ site.baseurl }}images/seeing-logic-with-existential-graphs/EG_05_Visual_Logic_Beyond_Education.png)

*Figure. Explores how visual logic can extend beyond educational contexts to enhance various aspects of understanding and communication.*

**Enhancing Business Processes**

In a corporate setting, visual logic can streamline communication and strategy development. For instance, imagine a corporate meeting where complex strategies are visually mapped, enabling clearer understanding and quicker consensus. By illustrating processes, dependencies, and outcomes, team members can gain a clearer understanding of the proposed plans, facilitating more effective collaboration.

Project management tools like **Asana** or **Trello** use visual boards to represent tasks, timelines, and responsibilities, enabling teams to see the progression of projects at a glance. This visual approach helps identify bottlenecks, allocate resources efficiently, and align team efforts toward common goals.

**Improving Communication**

Visual logic can also enhance public discourse by making arguments more transparent. By mapping out the logical structure of an argument, including premises and conclusions, we can better evaluate the validity of claims and identify logical fallacies. This clarity can lead to more productive discussions and a deeper understanding of complex issues.

In fields like law or policy-making, visual representations of legal arguments or regulatory frameworks can aid in interpreting intricate information, ensuring that stakeholders grasp the implications of decisions.

**Facilitating Everyday Problem-Solving**

In daily life, visual logic can assist in planning and organizing personal tasks. Mind mapping apps help individuals brainstorm ideas, set goals, and plan activities by visually connecting related concepts. This approach leverages our natural visual processing abilities to manage information more effectively.

By embracing visual logic across various contexts, we can enhance comprehension, foster better communication, and support more informed decision-making.

## Conclusion: Making the Invisible Visible

Visual logic transforms abstract reasoning into tangible representations, bridging the gap between complex ideas and intuitive understanding. By making the invisible visible, it allows us to see the underlying structures of logic, facilitating better comprehension, communication, and innovation.

The potential of visual logic is vast. In education, it can make learning more accessible and engaging. In business and technology, it can enhance collaboration and streamline complex processes. In daily life, it can aid in problem-solving and planning.

**Call to Action**

As we navigate an increasingly complex world, embracing visual logic becomes ever more crucial. Educators can integrate visual tools into curricula to foster critical thinking skills. Technologists and software developers can create platforms that leverage visual logic for data analysis and knowledge representation. Policymakers can utilize visual logic to clarify regulations and enhance transparency.

It is time to harness the power of visual logic to enhance understanding across all sectors. By adopting visual approaches to logic and reasoning, we can empower individuals to think more clearly, communicate more effectively, and make more informed decisions. Let us embrace visual logic as a vital tool for the 21st century, fostering a culture of clarity and insight in an increasingly complex world.

## References

- [Charles Sanders Peirce](https://plato.stanford.edu/entries/peirce/), Stanford Encyclopedia of Philosophy, revision 11 Feb 2021.

- John F. Sowa, [Conceptual Graphs, Chapter 5 of the Handbook of Knowledge Representation](https://www.jfsowa.com/cg/cg_hbook.pdf), Elsevier, 2008, pp 213-237.

- John F. Sowa, [Existential Graphs - The simplest notation for logic ever invented](https://jfsowa.com/talks/egintro.pdf), 10 Jan 2020.
  - This is a presentation slides.

- John F. Sowa, [Language, Ontology, And the Semantic Web](https://jfsowa.com/talks/eswc.pdf), eswc20 slides, 1 Sep 2020.

- John F. Sowa, [Knowledge Graphs for Language, Logic, Data, Reasoning](https://www.youtube.com/watch?v=J9_kXpZAcQY), Ontolog Forum video, 12 Feb 2020.
  - Presentation by John Sowa on the history of knowledge graphs, with applications to language, logic, data, reasoning, and more. Part of the Ontology Summit 2020. The slides are available at https://go.aws/2SkRNc3.

- Mark P. Mattson, [Superior pattern processing is the essence of the evolved human brain](https://www.frontiersin.org/journals/neuroscience/articles/10.3389/fnins.2014.00265/full), Frontiers in Neuroscience, Vol.8, 21 Aug 2014. [https://doi.org/10.3389/fnins.2014.00265](https://doi.org/10.3389/fnins.2014.00265)

- Curtis Newbold, [Use Pictures. Always. Why the Picture Superiority Effect (PSE) Matters](https://thevisualcommunicationguy.com/2018/11/06/use-pictures-always-why-the-picture-superiority-effect-pse-matters/), The Visual Communication Guy, 6 Nov 2018.

- Team Varthana, [Importance of Visual Aids in Teaching and Why it is Preferred](https://varthana.com/school/why-visual-aids-are-the-most-effective-teaching-tool-today/), Varthana, 29 Dec 2022.


