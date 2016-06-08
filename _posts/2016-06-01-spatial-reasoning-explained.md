---
layout: post
title: Spatial Reasoning Explained
date: 2016-06-01 12:00:00.000000000 -05:00
permalink: spatial-reasoning-explained
author: Benny Cheung
tags:
  - Spatial Reasoning
  - AI
  - Prolog
  - Logic
category: post
comments: true
image:
  cover: images/spatial-reasoning-explained/cover.jpg
  header: images/spatial-reasoning-explained/header.jpg
published: false
---
<!--excerpt.start-->
Spatial Reasoning is a logical reasoning system that assumed entities located in space,
and such entities have spatial structure. This is always a dream to make a machine which can perceive
and understand space. With machine's spatial intelligence, human daily life could be
enhanced by receiving assistant, such as spatial orientation, planning and navigation from the machine.
<!--excerpt.end-->

## Topics of Spatial Reasoning
Computer science has a list of interesting topics that required spatial reasoning
ability, such as artificial intelligence, spatial database, image processing and
linguistic processing.

* **Artificial Intelligence** -
Our everyday concepts are populated with qualitative spatial description. Something
is sitting next to something. The description is usually fuzzy and imprecise, but yet
we can deduce some non-trivial conclusion, e.g. a train is going west, if the station
exit is closer to the south, where would be sit on the train in order to exit fast.
This involved the spatial structure of the train and qualitative understanding of
a train travelling direction.

* **Spatial Database** -
In addition to well-known numeric or character objects, spatial object is a popular
extension to the collection of the database object. When the data has a spatial
attribute, for example the street address or phone number, we could use
the spatial proximity to calculate and deduce more info. We need to provide
a finite geometric representation and operation on these spatial entities.

* **Image Recognition** -
The object appears in the visual field, is a great interest to image recognition
application. The object usually occurred in a spatial context, for example, the book
is sitting on top of a table. The object is described geometrically and spatially
to precisely pin-point it's location and it's spatial occupation.

* **Linguistic Processing** -
In human activities, the stories are usually accompany with a spatial context. For
example, the battlefield logistics are relied on the spatial optimization, to locate
the most strategically advantage position. The method will be described both verbally
and visually on a map. Another example, a person lost in the middle of no where;
they usually can describe their spatial context in a fragmentary form. After listening
to the description, we must reconstruct the context to spatially pin-point
where the lose person is located.

## Spatial Logics
When we are looking at a logical system, we can evaluate formula $$A \land B$$ by evaluating
the truth or falsity of the entities $$A$$ and $$B$$ separately. The $$\land$$ acting as
an logical `AND` operator defined within the logical system, specified both
$$A$$ and $$B$$ must be true; then $$A \land B$$ will evaluate to true. If $$A$$ and $$B$$ are both
spatial entities, we are extending the formula with a spatial structure determining if
$$A \land B$$ in $$S$$ is possible. If it is possible, evaluate $$A \land B$$ can be true within the space $$S$$.

Assume a set of spatial entities $$A=\{A_1, A_2, ..., A_n\}$$
we can assert a spatial structure
$$S$$ will be true for set $$A$$. We call this set $$A$$ as the possible spatial configuration of $$S$$.
To put this definition into concrete example, if we need to navigate from a location X to
location Y on land, we would assume there is a road network structure that could
connect the location X and location Y.
We can see the set $$A=\{X, ..., Y\}$$ and
the road network connecting all elements of $$A$$ will be $$S$$.

Sometimes, the spatial context does not need to have a spatial entity occupied
a location. For example, the most familiar 2D cartesian coordinate system is a
spatial reference system. With a chosen origin, e.g. in 2D (0,0), all possibilities of location are layout explicitly. If there is a spatial entity
posited in this 2D cartesian coordinate system, we shall refer such entity's
location by measuring from the chosen origin. We shall come back to the difference
between *implicit* spatial location (topological relations) and *explicit* spatial location (geometrical relations) in the future discussion. We shall assume implicit spatial location (topological relations) in this article.

## Puzzles that required Spatial Logics
The question of how does a system looks like when it has spatial reasoning ability, is best answered by an example.
We shall illustrate the possibility of solving the spatial logics puzzle automatically
by writing a Prolog program. The following is a typical spatial logics puzzle that you can usually find in a puzzle book.

### Solving Spatial Logics Puzzle
Five married couples live in houses shown on the map below.

![Spatial Reasoning House Puzzle]({{ site.baseurl }}images/spatial-reasoning-explained/house-spatial-puzzle-400.jpg)

1. Claire lives further east than Walter, who isn't married to Mary.
2. Walter lives further west than Debbie, who lives further south than Bill.
3. Sandra lives further north than Katie, who lives further east than Adam.
4. Lenny lives further north than Martin.

Thanks to the one professor in the world, [Mihaela Malita](http://www.anselm.edu/internet/compsci/faculty_staff/mmalita/index.html) takes the logic puzzle seriously enough to supply an extremely useful [Prolog Puzzle Solving library](http://www.anselm.edu/internet/compsci/faculty_staff/mmalita/HOMEPAGE/logic/index.html). We shall build our spatial puzzle solver in Prolog on top of `bibmm.pl`. Once the library has been downloaded, the program can be imported as (assumed using [SWI Prolog](http://www.swi-prolog.org)):

```prolog
:-consult('bibmm.pl').
```

After careful analysis of the spatial configuration, we can code the following spatial structure.
(Note: in order to save space, we put multiple Prolog statements into one line)

```prolog
eastof(2,1). eastof(2,3). eastof(2,7). eastof(4,1).
eastof(4,3). eastof(4,7). eastof(7,1). eastof(7,3).

westof(1,2). westof(1,4). westof(1,7). westof(3,2).
westof(3,4). westof(3,7). westof(7,2). westof(7,4).

northof(7,1). northof(7,2). northof(7,3). northof(7,4).
northof(1,3). northof(1,4). northof(2,3). northof(2,4).

southof(1,7). southof(2,7). southof(3,7). southof(4,7).
southof(3,1). southof(4,1). southof(3,2). southof(4,2).
```

This is intentionally to enumerate all possible topological relations in this puzzle's spatial structure. We shall improve with the spatial logics system later.

With the definition of the spatial structure, we can proceed to write the Prolog
program to encode all the puzzle constraints, e.g. in our example, we have the list of 4 constraint statements.
By breaking down each constraint statement carefully, we shall obtain
the basic logic statement, either spatially or non-spatially constraints.

```prolog
% include the facts of spatial structure

house([1,2,3,4,7]).
husband([adam,bill,lenny,martin,walter]).
wife([claire,debbie,katie,mary,sandra]).

start(Sol):- husband(M),wife(F),house(H),
    Sol=[[M1,W1,H1],[M2,W2,H2],[M3,W3,H3],[M4,W4,H4],[M5,W5,H5]],
    set_equal([H1,H2,H3,H4,H5],H),
    % 1. Claire lives further east than Walter, who isn't married to Mary.
    eastof(X1,X2),
    member([_,claire,X1],Sol),
    member([walter,_,X2],Sol),
    member([_,mary,X3],Sol),
    X2 \= X3,
    % 2. Walter lives further west than Debbie, who lives further south than Bill.
    member([_,debbie,X4],Sol),
    westof(X2,X4),
    member([bill,_,X5],Sol),
    southof(X4,X5),
    % 3. Sandra lives further north than Katie, who lives further east than Adam.
    member([_,sandra,X6],Sol),
    member([_,katie,X7],Sol),
    northof(X6,X7),
    member([adam,_,X8],Sol),
    eastof(X7,X8),
    % 4. Lenny lives further north than Martin.
    member([lenny,_,X9],Sol),
    member([martin,_,X10],Sol),
    northof(X9,X10),
    set_equal([M1,M2,M3,M4,M5],M),
    set_equal([W1,W2,W3,W4,W5],W),
    !.
```

How to run with `swipl`:

```
?- ['house'].
?- start(Sol), write_list(Sol), fail.
```

After executing the Prolog program, the puzzle's solution will be revealed as,

```
[walter,sandra,1]
[lenny,debbie,2]
[adam,mary,3]
[martin,katie,4]
[bill,claire,7]
```

Just in case you don't now how to exit from `swipl`:

```
?- halt.
```

### Improved Spatial Relations Encoding
In the example, we have encoded the spatial structure via
their topological relations by enumerating all possible pairwise relationship.
This is not a very intelligent encoding scheme, and downright exhaustive.
Smart readers will immediately notice, with our spatial intelligence,
we have a set of spatial logics that can be applied.

For example,

```prolog
eastof(2,1).
westof(1,2).
```

We can see the relations `eastof` and `westof` are symmetrical relation,
such that we know `eastof(X,Y)` immediately implies `westof(Y,X)` by spatial symmetry.

Therefore, without encoding all the symmetrical spatial relations, we could enter
a logical rule as,

```prolog
westof(X,Y) :- eastof(Y,X).
```

Then, we don't need to encode any `westof` relations because `westof`
can be deduced from the symmetric `eastof` relation.

Similarly, we can put,

```prolog
southof(X,Y) :- northof(Y,X).
```

Then, we don't need to encode any `southof` relations because `southhof`
can be deduced from the symmetric `northof` relation.

The set of spatial relations are reduced to encode only `eastof` and `northof` relations.

```prolog
eastof(2,1). eastof(2,3). eastof(2,7). eastof(4,1).
eastof(4,3). eastof(4,7). eastof(7,1). eastof(7,3).

northof(7,1). northof(7,2). northof(7,3). northof(7,4).
northof(1,3). northof(1,4). northof(2,3). northof(2,4).
```

How about the transitive relations? We can reduce `northof` relations by
only encoding the direct `northof` entities. And let the transitive
logical rule taking care of the implicit spatial relationship.

```prolog
northof(X,Y) :-
  X \= Y,
  northof(X,Z),
  northof(Z,Y).
```

Finally, we can refine the spatial relations to this reduced set,
by dropping the `northof(7,3)` and `northof(7,4)` indirect `northof` relations.

```prolog
eastof(2,1). eastof(2,3). eastof(2,7). eastof(4,1).
eastof(4,3). eastof(4,7). eastof(7,1). eastof(7,3).

northof(7,1). northof(7,2).
northof(1,3). northof(1,4). northof(2,3). northof(2,4).
```

## Spatial Reasoning is a Logical System
We have illustrated spatial reasoning with a topological language written in Prolog.
The spatial entities are implicitly represented as a symbol, for example a house number.
We can take the route of encoding the spatial entities explicitly by
their geometric properties, then calculating their spatial relations
according to the geometric rules of the compass directions. In this way, the set of
topological relations can be generated instead of relying on hand-coded.

Spatial reasoning is a strategy to deduce spatial truth in a logical system.
We're entering the domain of classical logic reasoning, with a object is limited to spatial entity. The reasoning rules are governed by spatial logics, where the wealth of literatures can be referenced and studied. A good starting point is "The Handbook of Spatial Logics" by Marco Aiello et al..

The spatial logics overlay a structure of possibilities, where many non-logical
spatial situation could be quickly eliminated. This structure is the working premise of spatial validity.
We need to follow the strict logical rules of spatial formula, such as the symmetric and transitive spatial rules as illustrated.
The indirect spatial relations can be deduced logically.
The spatial relation is not necessary just a simple compass rule, only describing direction;
spatial relation can be generated by any computational geometry, such as convex hull or intersections, to have a wider range of spatial reasoning abilities.
Understanding this foundation, you may find spatial reasoning is applicable in many life applications; then you will build interests in spatial reasoning.
