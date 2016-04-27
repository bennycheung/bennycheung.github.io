# How to Setup Jekyll Blogging

## Edit Jekyll Configuration
This Jekyll `_config.yml` defines all the site's keys; change all the keys to your relevant information

## Edit Link Pages
This set of pages, with layout `pages`, will show up in the sidebar navigation as links. By default, we have
  1. About - about.md tell something about you and your site
  2. Blog - dynamically generated the list all posts in your site
  3. Projects - projects.md list your interesting projects
  4. Research - research.md list the research items
  5. Resume - resume.md show your resume

## Write Blog Pages
Put your blog pages into `_posts` directory, with the proper `YYYY-MM-DD-your-post-title.md` as the file name format. Within the post, you should have at least the following metadata, the layout `post` should be used.

```
---
layout: post
title: 'Some Exciting Title'
permalink: 'some-exciting-title'
author: Author Name
tags:
  - Tag1
  - Tag2
categories:
  - Posts
cover: images/some-exciting-title/cover.jpg
---
```

The `cover` metadata key is for the post's head image (assumed to be 800x80). You can find the samples in the `_posts` directory.

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
