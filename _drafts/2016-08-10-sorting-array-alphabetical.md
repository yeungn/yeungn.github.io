---
layout: post
title:  "Sorting arrays"
date:   2016-08-10
categories: Learn Labs
---

http://ruby-doc.org/core-2.3.1/Enumerable.html#method-i-sort_by

{% highlight ruby %}
all = ["Thriller", "Blank Space", "Call Me Maybe"]
all.sort_by { |song| song}
{% endhighlight %}