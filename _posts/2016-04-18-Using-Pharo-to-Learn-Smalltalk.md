---
layout: post
title: Using Pharo to Learn Smalltalk
date: 2016-04-18 12:00:00.000000000 -05:00
permalink: using-pharo-to-learn-smalltalk
author: Benny Cheung
tags:
  - Smalltalk
  - Pharo
  - RaspberryPi
category: post
comments: true
image: images/using-pharo-to-learn-smalltalk/cover2x.jpg
images:
  cover: images/using-pharo-to-learn-smalltalk/cover.jpg
  header: images/using-pharo-to-learn-smalltalk/header.jpg
published: false
---
<!--excerpt.start-->Pharo is an open source implementation of the programming language and environment Smalltalk. Pharo emerged as a fork of Squeak, an open source Smalltalk environment created by the Smalltalk-80 team. This article explores how to use Pharo to learn Smalltalk, using Pharo unique package management tools and running Pharo on Raspberry Pi.
<!--excerpt.end-->

Inria is the company who produce Pharo and many related software anaysis tool. You can find the list here:

* [Inria Softwares List](http://rmod.inria.fr/web/software)

## Pharo Video Tutorial
Here are some recommended Pharo learning tutorials:

* [Learning Pharo](http://www.jarober.com/blog/st4u.ssp)
* [Learning more Pharo](https://www.youtube.com/playlist?list=PLqbtQ7OkSta0ULYAd7Qdxof851ybh-_m_)

## Pharo Books
Pharo team produced an excellent free book, that you can download from here:

* [Deep into Pharo Book](http://deepintopharo.com)

## Presentation
1. There is a nice introduction to Smalltalk and Pharo environment by Marcus Denker
[Pharo Objects at Your Fingertip](https://www.youtube.com/watch?v=xhPlUaXpCU4) and
[Presentation Slides](http://www.slideshare.net/MarcusDenker/pharo-objects-at-your-fingertips)

1. Tudor Girba - Pharo: Playing with Live Object
(where AtomMorph demo are showing)
* [Playing with Live Object](https://vimeo.com/97315968)

1. Laurent Laffont - Manipulating Objects
(where AtomMorph demo are showing; this video is technical details)
* [Manipulating Live Objects](https://vimeo.com/34810463)

Pharo is the cool new kid on the object-oriented languages arena. It is Smalltalk-inspired. It is dynamic. It comes with a live programming environment in which objects are at the center. And, it is tiny. But, most of all, it makes serious programming fun by challenging almost everything that got to be popular. For example, imagine an environment in which you can extend Object, modify the compiler, customize object the inspector, or even build your own the domain-specific debugger. And, you do not even have to stop the system while doing that.

## Monticello
Tons of packages can be found at:

* [Smalltalk Hub for Shared Packages](http://smalltalkhub.com)

After finding what you like, you can use *Monticello Browser* to add the package.

![Pharo Monticello Add Repo Example]({{ site.baseurl }}/images/using-pharo-to-learn-smalltalk/Pharo_Monticello_Add_Repo_Examples_annotated_sm.png)

The repository can be added, for example

{% highlight smalltalk %}
MCHttpRepository
	location: 'http://smalltalkhub.com/mc/PharoExtras/MorphExamplesAndDemos/main'
	user: ''
	password: ''
{% endhighlight %}

### Demo with BouncingAtomsMorph

The tutorial steps on using AtomMorph Demo are repeated here. For a newcomer on learning Smalltalk,
this AtomMorph Demo illustrates many amazing features of the Smalltalk dynamic nature and it's
development environment.

![Pharo AtomMorph Demo]({{ site.baseurl }}/images/using-pharo-to-learn-smalltalk/Pharo_AtomsMorph_Example_annotated_sm.png)

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

{% highlight smalltalk %}
bounced ifTrue: [self velocity: vx @ vy. Beeper beep ].
{% endhighlight %}

- very noisy, so add test for color red

{% highlight smalltalk %}
bounced ifTrue: [self velocity: vx @ vy.
	self color = Color red ifTrue: [Beeper beep] ].
{% endhighlight %}

Alternative:

- create a subclass of AtomMorph with a different color that beeps
- define BeepingAtomMorph

{% highlight smalltalk %}
bounceIn: aRect
	| bounced |
	bounced := super bounceIn: aRect.
	bounced ifTrue: [ Beeper beep ].
	^ bounced

defaultColor
	^ Color red
{% endhighlight %}

- BeepingAtomMorph new openInWorld
- instantiate it and embed it
- find senders of bounceIn:
- see BouncingAtomMorph>>step tests AtomMorph class
- we can change BouncingAtomMorph>>step or BeepingAtomMorph as follows:

{% highlight smalltalk %}
isMemberOf: aClass
	^AtomMorph == aClass
{% endhighlight %}

Show all Morph Instances

{% highlight smalltalk %}
BouncingAtomsMorph allInstances.
{% endhighlight %}

Remove all Morph
Inspect BoundingAtomsMorph object and execute,

{% highlight smalltalk %}
self removeAllMorphs
{% endhighlight %}

## Metacello
Metacello is a package management system for Monticello (a versioning system used in Smalltalk). There is a chapter about Metacello in the "Deep into Pharo" book, and it gives a good in-depth knowledge about this system. On the other hand when I was starting to use Metacello, I needed something more simple and direct, like what I described here.

In Pharo, Metacello is presented as *Configuration Browser*, which you can use to easily install more packages.

![Pharo Metacello Browser]({{ site.baseurl }}/images/using-pharo-to-learn-smalltalk/Pharo_Metacello_Browser_sm.png)

### Install Packages

|---
| Package  | Description |
|:--------:|-------------|
| Roassal2 | Roassal graphically renders objects using short and expressive Smalltalk expressions. A large set of interaction are offered for a better user experience. Painting, brushing, interconnecting, zooming, drag and dropping will just make you more intimate with any arbitrary object model. Documentation is here [Roassal2 Documentation](http://agilevisualization.com)
| NeoJSON | JSON (JavaScript Object Notation) is a popular data-interchange format. A number of implementations of this simple format already exist. NeoJSON is a more flexible and more efficient reader and writer for this format. Documentation is here [NeoJSON Paper](https://github.com/svenvc/docs/blob/master/neo/neo-json-paper.md)
| NeoCSV | CSV (Comma Separated Values) and more generally other delimiter-separated-value formats like TSV are probably the most common data exchange format. A number of implementations of this simple format already exist. NeoCSV is a more flexible and more efficient reader and writer for this format. Documentataion is here [NeoCSV Paper](https://github.com/svenvc/docs/blob/master/neo/neo-csv-paper.md)

## Pharo running on Raspberry Pi

For Raspberry Pi lover, of course we can run Pharo on it. The
easy way is to download the precompiled result at:
[Precompiled Raspberry Pi Pharo Image](https://ci.inria.fr/pharo-contribution/view/ARM/job/RaspberryPi-Cross-Compilation-FastBltBit/lastSuccessfulBuild/artifact/vmSources/results.tar.gz)

If you are hardcore Pi-er, you wanted to do it yourselves. You can explore this link:
[Compile Pharo by Hand](https://pharoweekly.wordpress.com/2014/02/19/raspberrypi/)

After you have the compiled Pharo image, copy to a Raspberry Pi, let's say folder named *Pi_Pharo*.
Here is a picture showing Pharo is running on Raspberry Pi via VNC viewer.

{% highlight shell %}
% cd Pi_Pharo
% ./PharoS Pharo.4.0.image
{% endhighlight %}

![Pharo 4 running on Raspberry Pi]({{ site.baseurl }}/images/using-pharo-to-learn-smalltalk/Pharo_on_Raspi2_sm.png)

That's all for now, have fun learning Smalltalk!
