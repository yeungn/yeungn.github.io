---
layout: page
title: Building a Cli Gem
permalink: /building-a-cli-gem/
date:   2016-09-15 17:23:54
---

My goal today is to write a step by step process on building a [CLI](https://en.wikipedia.org/wiki/Command-line_interface) [Ruby Gem](https://rubygems.org/). This simple application will allow a user to grab the latest apartment listing from Apartment Finder.

******* insertting video screen cast here *******

# 1.  Getting Started

What you need to build this CLI Gem:

  1.  [Ruby](https://www.ruby-lang.org/en/)
  2.  [RVM](https://rvm.io/) (optional)
  3.  [Sublime Text](https://www.sublimetext.com/) *(my choice at the time of this writing)*
  4.  [Terminal](https://en.wikipedia.org/wiki/Terminal_(OS_X)) (Mac)
  5.  [Ruby Gems Account](https://rubygems.org/sign_up) to host your gem

  I watched a video that Avi made for us that helped walked us through most all of the process. His instructions are pretty easy to understand. Without the helpful video, i would have been so lost.

# 2.  Planning

  What I want the CLI to do
  - user installs gem from rubygems.org
  - runs program by typing `apt-finder`
  - program geets the user
  - shows a short list of available apartments
  - shows a menu of option
    - ask user to select number from the number list
      - show extra deatails about specific listing
    - show error message if number is invalid
    - show list of option when user type list
    - end program when the user types exit

# 3.  Sources

    - which site(s) are easier to scrape the listings?
    - craigslist - read craiglist TOS
      - I copy some listings to store locally for testng
    - http://www.apartmentfinder.com/
    - https://www.renthop.com/nyc-apartments-for-rent
    - http://www.nakedapartments.com/renter/listings/search
    - StreetEasy
    - http://www.brickunderground.com/blog/2012/01/8_best_websites_for_finding_a_no_fee_apt_in_new_york_city

  I eneded up with Apartmentfinder.com.

 - how i got stuck on the part where the i get info from another url

Lets get started. Assuming you have [Ruby](https://www.ruby-lang.org/en/downloads/) and [RVM](https://rvm.io/rvm/install) installed on your system.

check if you have the following installed, run the commands in terminal:

* `ruby -v` Check for Ruby version(s)

*=>`ruby 2.2.1p85 (2015-02-26 revision 49769) [x86_64-darwin14]`*

optional
* `rvm -v` Check the Ruby Version Manager

* `rvm gemset create <name>` creates a new [gemset](https://rvm.io/gemsets)
- `rvm gemset use <gemset name>` switchs over to the new gemset created
- `rvm gemset delete <gemset name>` if you need to delete

I named my gemset apt-finder

```
rvm gemset create apt-finder
ruby-2.2.1 - #gemset created /Users/nin/.rvm/gems/ruby-2.2.1@apt-finder
ruby-2.2.1 - #generating apt-finder wrappers........
```

to switch over and use the created gemset

`rvm gemset use apt-finder`

```
Using ruby-2.2.1 with gemset apt-finder
```

Now that we got that outof the way.

Next we will be using a gem called bundler to generate some files for this gem project, but first we will need to install the gem.

check to see if you have the gem installed

`gem list`

if not, install the bundler gem by typing

`gem install bundler`

```
Fetching: bundler-1.13.1.gem (100%)
Successfully installed bundler-1.13.1
```

Lets use bundler to help generate some files for us.

<!-- Depending on your system, you may or may not be prompted with set up. -->

`bundler gem apt_finder`

```
Creating gem 'apt_finder'...
MIT License enabled in config
Code of conduct enabled in config
      create  apt_finder/Gemfile
      create  apt_finder/.gitignore
      create  apt_finder/lib/apt_finder.rb
      create  apt_finder/lib/apt_finder/version.rb
      create  apt_finder/apt_finder.gemspec
      create  apt_finder/Rakefile
      create  apt_finder/README.md
      create  apt_finder/bin/console
      create  apt_finder/bin/setup
      create  apt_finder/.travis.yml
      create  apt_finder/.rspec
      create  apt_finder/spec/spec_helper.rb
      create  apt_finder/spec/apt_finder_spec.rb
      create  apt_finder/LICENSE.txt
      create  apt_finder/CODE_OF_CONDUCT.md
Initializing git repo in /Users/nin/Development/code/apt_finder
```

change to the new directory

`cd apt_finder`

create a new executable file in the bin directory

`cd bin`

`touch apt-finder`

`apt-finder` is not setup with executable permission. to change this we need to change the permisson.

`l`

```
total 24
drwxr-xr-x   5 nin  staff   170B Sep 13 14:01 .
drwxr-xr-x  15 nin  staff   510B Sep 13 13:54 ..
-rw-r--r--   1 nin  staff    28B Sep 13 14:02 apt-finder
-rwxr-xr-x   1 nin  staff   335B Sep 13 13:54 console
-rwxr-xr-x   1 nin  staff   131B Sep 13 13:54 setup
```

or

`ls -lah`

```
total 24
drwxr-xr-x   5 nin  staff   170B Sep 13 14:01 .
drwxr-xr-x  15 nin  staff   510B Sep 13 13:54 ..
-rw-r--r--   1 nin  staff    28B Sep 13 14:02 apt-finder
-rwxr-xr-x   1 nin  staff   335B Sep 13 13:54 console
-rwxr-xr-x   1 nin  staff   131B Sep 13 13:54 setup
```


`chmod +x apt-finder`

```
total 24
drwxr-xr-x   5 nin  staff   170B Sep 13 14:01 .
drwxr-xr-x  15 nin  staff   510B Sep 13 13:54 ..
-rwxr-xr-x   1 nin  staff    28B Sep 13 14:02 apt-finder
-rwxr-xr-x   1 nin  staff   335B Sep 13 13:54 console
-rwxr-xr-x   1 nin  staff   131B Sep 13 13:54 setup
```
open the file using a text editor of your choice. I am using sublime text. i am adding a puts statement in the file to test if we can read from that file.

`puts 'Welcome to Apt Finder'`

`./bin/apt-finder`

```
./bin/apt-finder
./bin/apt-finder: line 1: puts: command not found
```

we get this error because we did not tell our system how to process this file.

Adding this line, tells the system to use the ruby interpeter

`#!/usr/bin/env ruby`

lets try running that again
```
./bin/apt-finder
Welcome to Apt Finder
```

Now we're all set up and ready to plan our program.

1. I will try to find a site that is easy for me to scrape
2. what i would like is for a user to install this gem run the program by typing in apt-list
3. after the user types apt-list scrape the current list and display listings on the users screen.
4. give the user the option to select the listing by number and after selection shw the deatils of that listing
5. if number is not a valid option then prompt the user to type the valid options

Adding dependencies in gemspec
- nokogiri
- pry

```
require 'open-uri'
require 'nokogiri'
require 'pry'
```

Publishing the gem on [rubygems.org](rubygems.org)
apt_finder version 0.1.0 was published on rubygems.org. I ran into an issue trying to use the gem so I thought that I may have messed up somewhere building the gem. I deceided to delete the gem published on rubygems.org and followed instruction to [`gem yank`](http://help.rubygems.org/kb/gemcutter/removing-a-published-rubygem).

gem build apt_finder.gemspec
WARNING:  See http://guides.rubygems.org/specification-reference/ for help
ERROR:  While executing gem ... (Gem::InvalidSpecificationException)
    ["bin/apt-finder"] are not files

    git commit new code first

