---
layout: post
title: sinatra
permalink: /another-post/
date:   2016-10-13
---

Adding a database to your sinatra appplication

to use activerecord
  add `gem activerecord` gives us access to the magical database mapping and association poers
  add `sinatra-activerecord` gives us access to some awesome Rake tasks.
  add `rake` package that lets us quickly create files, folders, and automate tasks such as database creation

in our `development group`, we'll add two other gem
  add `tux` interactive console that pre-loads our database and ActiveRecord relationships
  add `sqlite` database adapter
