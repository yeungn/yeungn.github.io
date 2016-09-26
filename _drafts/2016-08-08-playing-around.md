---
layout: post
title:  "Playing around"
date:   2016-08-08
categories: Playing-around
---

{{ site.time | date_to_xmlschema }}

{{ site.time | date_to_rfc822 }}

{{ site.time | date_to_string }}

{{ site.time | date_to_long_string }}

{{ site.members | where:"graduation_year","2014" }}

{{ site.members | where_exp:"item",
"item.graduation_year == 2014" }} {{ site.members | where_exp:"item",
"item.graduation_year < 2014" }} {{ site.members | where_exp:"item",
"item.projects contains 'foo'" }}

{{ site.members | group_by:"graduation_year" }}
[{"name"=>"2013", "items"=>[...]},
{"name"=>"2014", "items"=>[...]}]

{{ page.content | xml_escape }}