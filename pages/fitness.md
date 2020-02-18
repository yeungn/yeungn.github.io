---
layout: page
title: Fitness
permalink: /fitness/
---

<div class="home">

{%- for post in site.posts -%}
    {%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
    <ul class="post-list">
        <li>    
            <span class="post-meta">{{ post.date | date: date_format }}</span>
            <a class="post-link" href="{{ post.url | relative_url }}">{{ post.title }}</a>
        </li>
    </ul>
 {%- endfor -%}

</div>
