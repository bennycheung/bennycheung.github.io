# How to Setup Jekyll Blogging

## Edit Jekyll Configuration
This Jekyll `_config.yml` defines all the site's keys; change all the keys to your relevant information

## Edit Link Pages
This set of pages, with layout `pages`, will show up in the sidebar navigation as links. By default, we have
  1. About - about.md tell something about you and your site
  2. Research - research.md list the research items

## Write Blog Pages
Put your blog pages into `_posts` directory, with the proper `YYYY-MM-DD-your-post-title.md` as the file name format. Within the post, you should have at least the following metadata, the layout `post` should be used.

For example,

```
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
image:
  teaser: images/using-pharo-to-learn-smalltalk/cover.jpg
---
```

The `image.teaser` metadata key is for the post's head image (assumed to be 800x600). You can find the samples in the `_posts` directory.

### Post Excerpt
The tag `<!--excerpt.start-->` and `<!--excerpt.end-->` mark the beginning and the end of the excerpt in the post, that would be put on the post's summary block in the front page.

### Image Location
All images referenced in the post should be placed in `images` directory, and refers to the image prefixed by `{{ site.baseurl }}/images/`.

## Local Testing
You can install Jekyll locally, and serve the pages locally by running (--baseurl to override the configured site URL to nothing, make it able to run locally with all the links correctly points to localhost),

```
  jekyll server --baseurl ""
```

Now, you can navigate to `localhost:4000` to view your blog pages.
