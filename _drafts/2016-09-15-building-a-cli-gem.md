---
layout: page
title: How to build a Cli Gem
permalink: /how-to-build-a-cli-gem/
date:   2016-09-15 17:23:54
---

# 1.  Getting Started

What you need to build this CLI Gem:

  1.  [Ruby](https://www.ruby-lang.org/en/)
  2.  [RVM](https://rvm.io/) (optional)
  3.  [Sublime Text](https://www.sublimetext.com/) or any text editor
  4.  [Terminal](https://en.wikipedia.org/wiki/Terminal_(OS_X)) (Mac)
  5.  [Github Account](https://github.com/)
  6.  [Ruby Gem Account](https://rubygems.org/sign_up)

  The first thing I did, I watched a couple videos that Avi made for us and that really helped walked me through most of the process. 

  The applicatin will look like this:

  <img src="/assets/apt_finder.gif">

# 2.  Planning

Finding a website to get data from:
  - `http://www.apartmentfinder.com/New-York/New-York-Apartments`

What I want the CLI to do
  - allow users to run the program by typing in apt_finder
  - show a short list of available apartments
  - show a menu of options
  - ask user to select number from the number list
  - show extra details about specific listing
  - show error message if number is invalid
  - end program when the user types exit
  -show list of option when user type list

  I eneded up with Apartmentfinder.com.

I should have wrote this while working on the Gem. I am trying to remember as much as a I can at the moment, so some steps might not be in order and/or missing. If anything is confusing or doesn't make any sense, feel free to contact [me](mailto:nin.yeung@gmail.com).
 
 - how i got stuck on the part where the i get info from another url

# Step 1 *(setting up files)*

We will be using a gem called bundler to generate some files for this Cli project.

Check if you have the gem installed

`gem list`

if not, install the bundler gem by typing

`gem install bundler`

```
Fetching: bundler-1.13.1.gem (100%)
Successfully installed bundler-1.13.1
```

Using bundler to help generate some files for us.

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

`touch apt_finder`

`apt_finder` 

The new file is not setup with executable permission.

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

Changing the permission to that file

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
