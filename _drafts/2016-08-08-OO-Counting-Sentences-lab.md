---
layout: post
title:  "OO Counting Sentences Lab"
date:   2016-08-08
categories: OO-Counting-Sentences-lab
---

```
#count_sentences
  returns the number of sentences in a string
  returns zero if there are no sentences in a string
  returns the number of sentences in a complex string (FAILED - 1)
```
```
Failures:

  1) String#count_sentences returns the number of sentences in a complex string
     Failure/Error: expect(complex_string.count_sentences).to eq(4)

       expected: 4
            got: 2

       (compared using ==)
     # ./spec/count_sentences_spec.rb:47:in `block (3 levels) in <top (required)>'
```
```
 describe "#count_sentences" do

    it  "returns the number of sentences in a string" do
      expect("one. two. three?".count_sentences).to eq(3)
    end

    it "returns zero if there are no sentences in a string" do
      expect("".count_sentences).to eq(0)
    end

    it "returns the number of sentences in a complex string" do
      complex_string = "This, well, is a sentence. This is too!! And so is this, I think? Woo..."
      expect(complex_string.count_sentences).to eq(4)
    end
```
{% highlight ruby %}
class String

  def sentence?
   self.end_with?(".")
  end

  def question?
    self.end_with?("?")
  end

  def exclamation?
    self.end_with?("!")
  end

  def count_sentences
    self.split(/[.!]/).count
  end
end
{% endhighlight %}