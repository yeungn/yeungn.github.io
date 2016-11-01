---
layout: post
title:  "OO School Domain Lab"
date:   2016-08-08
categories: OO-School-Domain-Lab
---

How doyou explain and use the `||=` (OR Equal) ?

Not sure how to pass or get more information to pass this test. If i remember correctly, this is where eveything goes down the drain.

#sort
    is able to sort the students (FAILED - 1)

Failures:

  1) School #sort is able to sort the students
     Failure/Error: expect(@school.sort).to eq({7 => ["Blake Johnson", "Jack Bauer"], 9 => ["Bart Simpson", "Homer Simpson"], 10 => ["Avi Flombaum", "Jeff Baird"]})

       expected: {7=>["Blake Johnson", "Jack Bauer"], 9=>["Bart Simpson", "Homer Simpson"], 10=>["Avi Flombaum", "Jeff Baird"]}
            got: nil

       (compared using ==)
     # ./spec/student_spec.rb:58:in `block (3 levels) in <top (required)>'

{% highlight ruby %}
class School
  attr_accessor :roster

  def initialize(roster)
    @roster = {}
  end

  def add_student(name, grade)
    @roster[grade] ||= []
    @roster[grade] << name
  end

  def grade(grade)
    @roster[grade]
  end

  def sort
    # @roster.each_value {|array| array.sort!}
  end
end

{% endhighlight %}