---
layout: page
title: Blog
date: 2016-04-18 08:31:00
permalink: /blog/
---
<section id="archive">
  <h3>Recent posts</h3>
  {%for post in site.posts %}
    {% unless post.next %}
      <ul class="this">
    {% else %}
      {% capture year %}{{ post.date | date: '%Y' }}{% endcapture %}
      {% capture nyear %}{{ post.next.date | date: '%Y' }}{% endcapture %}
      {% if year != nyear %}
        </ul>
        <h3>{{ post.date | date: '%Y' }}</h3>
        <ul class="past">
      {% endif %}
    {% endunless %}
      <li><time>{{ post.date | date:"%d %b-%y" }}</time><a href="{{ post.url }}">  {{ post.title }}</a></li>
  {% endfor %}
  </ul>
</section>
