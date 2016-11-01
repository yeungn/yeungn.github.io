---
layout: post
title:  "how to iterate over an array and populate a hash with the key/value pairs"
date:   2016-08-09
---


[ruby-class-variables-and-class-methods-lab-v-000](http://github.com/yeungn/ruby-class-variables-and-class-methods-lab-v-000)

How to iterate over an array and populate a hash with the key/value pairs.


rspec

```
describe ".genre_count" do
  it "is a class method that returns a hash of genres and the number of songs that have those genres" do
    expect(Song.genre_count).to eq({"pop" => 1, "rap" => 2})
  end
end
```

error

```
.genre_count
  is a class method that returns a hash of genres and the number of songs that have those genres (FAILED - 1)

Failures:

  1) Song .genre_count is a class method that returns a hash of genres and the number of songs that have those genres
   Failure/Error: expect(Song.genre_count).to eq({"pop" => 1, "rap" => 2})

     expected: {"pop"=>1, "rap"=>2}
          got: nil

     (compared using ==)
   # ./spec/song_spec.rb:72:in `block (3 levels) in <top (required)>'
```

Answer found here in this article [Ruby Quick Tip: Easily Count Occurrences of Array Elements](http://jerodsanto.net/2013/10/ruby-quick-tip-easily-count-occurrences-of-array-elements/)

{% highlight ruby %}
  words.each_with_object(Hash.new(0)) { |word,counts| counts[word] += 1 }
{% endhighlight %}