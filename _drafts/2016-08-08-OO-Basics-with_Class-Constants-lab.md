---
layout: post
title:  "OO Basics with Class Constants"
date:   2016-08-08
categories: OO-Basics-with-Class-Constants
---

>Shoe
  BRANDS
    keeps track of all brands (FAILED - 1)
    only keeps track of unique brands (FAILED - 2)

>Failures:

> 1) Shoe BRANDS keeps track of all brands
    Failure/Error: expect(Shoe::BRANDS).to include(brand)
      expected [] to include "Uggs"
    # ./spec/02_shoe_spec.rb:13:in `block (4 levels) in <top (required)>'
    # ./spec/02_shoe_spec.rb:12:in `each'
    # ./spec/02_shoe_spec.rb:12:in `block (3 levels) in <top (required)>'

> 2) Shoe BRANDS only keeps track of unique brands
    Failure/Error: expect(Shoe::BRANDS.size).to eq(3)

      expected: 3
           got: 0

      (compared using ==)
    # ./spec/02_shoe_spec.rb:24:in block (3 levels) in <top (required)>

{% highlight ruby %}
class Shoe
  attr_accessor :color, :size, :material, :condition
  attr_reader :brand

  BRANDS = []

  def initialize(brand)
    @brand = brand
    BRANDS << brand

    #BRANDS.uniq!

    # ---OR---

    #if !BRANDS.include?(brand)
     # BRANDS << brand
    #end

    # ---OR---

   # BRANDS << brand unless BRANDS.include?(brand)

  end

  def cobble
    self.condition = "new"
    puts "Your shoe is as good as new!"
  end

end

{% endhighlight %}
