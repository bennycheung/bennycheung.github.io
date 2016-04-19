---
title: 'Learning Smalltalk with Pharo'
author: Benny Cheung
layout: post
categories:
  - Posts
---
<!--excerpt.start-->Pharo is an open source implementation of the programming language and environment Smalltalk. Pharo emerged as a fork of Squeak, an open source Smalltalk environment created by the Smalltalk-80 team.
<!--excerpt.end-->

Inria is the company who produce Pharo and many related software anaysis tool. You can find the list here:
http://rmod.inria.fr/web/software

## Pharo Video Tutorial
http://www.jarober.com/blog/st4u.ssp
https://www.youtube.com/playlist?list=PLqbtQ7OkSta0ULYAd7Qdxof851ybh-_m_

## Pharo Books
http://deepintopharo.com

## Presentation
1. There is a nice introduction to Smalltalk and Pharo environment by Marcus Denker
Pharo Objects at Your Fingertip: https://www.youtube.com/watch?v=xhPlUaXpCU4
Slides at: http://www.slideshare.net/MarcusDenker/pharo-objects-at-your-fingertips

1. Tudor Girba - Pharo: Playing with Live Object
(where AtomMorph demo are showing)
https://vimeo.com/97315968

1. Laurent Laffont - Manipulating Objects
(where AtomMorph demo are showing; this video is technical details)
https://vimeo.com/34810463

Pharo is the cool new kid on the object-oriented languages arena. It is Smalltalk-inspired. It is dynamic. It comes with a live programming environment in which objects are at the center. And, it is tiny. But, most of all, it makes serious programming fun by challenging almost everything that got to be popular. For example, imagine an environment in which you can extend Object, modify the compiler, customize object the inspector, or even build your own the domain-specific debugger. And, you do not even have to stop the system while doing that. In this talk, we show hands-on how live objects look like and we get to play with them in multiple scenarios.

## Monticello
Tons of stuffs at:
http://smalltalkhub.com

After finding what you like, you can use `Monticello Browser` to add the package.

![Pharo Monticello Add Repo Example]({{ site.baseurl }}/images/Pharo_Monticello_Add_Repo_Examples_annotated_sm.png)

The repository can be added, for example

```
MCHttpRepository
	location: 'http://smalltalkhub.com/mc/PharoExtras/MorphExamplesAndDemos/main'
	user: ''
	password: ''
```

### Demo with BouncingAtomsMorph

AtomMorph Demo Steps:

![Pharo AtomMorph Demo]({{ site.baseurl }}/images/Pharo_AtomsMorph_Example_annotated_sm.png)

- BouncingAtomsMorph new openInWorld
- meta-click>open explorer
- select some submorphs>AtomMorph and inspect it
- self color: Color red
- self velocity: 0@0
- drag out the red AtomMorph
- make it larger
- copy it
- inspect it
- self velocity: 2@3
- drag it back to the BouncingAtomsMorph
- click on the red Menu handle and embed it
- self browse the AtomMorph
- browse velocity:
- browse senders of velocity: -> browse #bounceIn:
- modify to beep after bounce:

```
bounced ifTrue: [self velocity: vx @ vy. Beeper beep ].
```

- very noisy, so add test for color red

```
bounced ifTrue: [self velocity: vx @ vy.
	self color = Color red ifTrue: [Beeper beep] ].
```

Alternative: (not used)

- create a subclass of AtomMorph with a different color that beeps
- define BeepingAtomMorph

```
bounceIn: aRect
	| bounced |
	bounced := super bounceIn: aRect.
	bounced ifTrue: [ Beeper beep ].
	^ bounced

defaultColor
	^ Color red
```

- BeepingAtomMorph new openInWorld
- instantiate it and embed it ...
- Doesn't work -- why not?!
- find senders of bounceIn:
- see BouncingAtomMorph>>step tests AtomMorph class
- we can change BouncingAtomMorph>>step or BeepingAtomMorph as follows:

```
isMemberOf: aClass
	^AtomMorph == aClass
```

Show all Morph Instances

```
BouncingAtomsMorph allInstances.
```

Remove all Morph
Inspect BoundingAtomsMorph object and execute,

```
self removeAllMorphs
```

## Metacello
Metacello is a package management system for Monticello (a versioning system used in Smalltalk). There is a chapter about Metacello in the "Deep into Pharo" book, and it gives a good in-depth knowledge about this system. On the other hand when I was starting to use Metacello, I needed something more simple and bold.

In Pharo, Metacello is presented as `Configuration Browser`, which you can use to easily install more packages.

![Pharo Metacello Browser]({{ site.baseurl }}/images/Pharo_Metacello_Browser_sm.png)

### Install Packages

| Packaage | Description |
|----------|-------------|
| Roassal2 | Roassal graphically renders objects using short and expressive Smalltalk expressions. A large set of interaction are offered for a better user experience. Painting, brushing, interconnecting, zooming, drag and dropping will just make you more intimate with any arbitrary object model. Documentation is here http://agilevisualization.com
| NeoJSON | JSON (JavaScript Object Notation) is a popular data-interchange format. A number of implementations of this simple format already exist. NeoJSON is a more flexible and more efficient reader and writer for this format. Documentation is here https://github.com/svenvc/docs/blob/master/neo/neo-json-paper.md
| NeoCSV | CSV (Comma Separated Values) and more generally other delimiter-separated-value formats like TSV are probably the most common data exchange format. A number of implementations of this simple format already exist. NeoCSV is a more flexible and more efficient reader and writer for this format. Documentataion is here https://github.com/svenvc/docs/blob/master/neo/neo-csv-paper.md

## Pharo running on Raspberry Pi
Easy way, download the precompiled result:
https://ci.inria.fr/pharo-contribution/view/ARM/job/RaspberryPi-Cross-Compilation-FastBltBit/lastSuccessfulBuild/artifact/vmSources/results.tar.gz

If you are hardcore, wanted to do it yourselves:
https://pharoweekly.wordpress.com/2014/02/19/raspberrypi/

After you have the compiled Pharo image, copy to a Raspberry Pi, let's say folder named `Pi_Pharo`.

```
% cd Pi_Pharo
% ./PharoS Pharo.4.0.image
```

![Pharo 4 running on Raspberry Pi]({{ site.baseurl }}/images/Pharo_on_Raspi2_sm.png)
