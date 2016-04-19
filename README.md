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
Put your blog pages into `_posts` directory, with the proper `YYYY-MM-DD-your-post-title.md` as the file name format. Within the post, you should have at least the following metadata,

```
  ---
  title: 'Learning About Something'
  author: Author Name
  layout: post
  categories:
    - Posts
  --
```

### Post Excerpt
The tag `<!--excerpt.start-->` and `<!--excerpt.end-->` mark the beginning and the end of the excerpt in the post, that would be put on the post's summary block in the front page.

### Image Location
All images referenced in the post should be placed in `images` directory, and refers to the image prefixed by `{{ site.baseurl }}/images/`.
