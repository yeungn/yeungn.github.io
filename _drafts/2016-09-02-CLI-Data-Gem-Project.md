---
layout: post
title:  "CLI Data Gem Project"
date:   2016-09-02
categories: Obeject Oriented Programming Ruby
---

## Building a command line interface for:

<!-- - Junior Web developers seeking employment in NYC.
  - URL
  - title
  - date posted
  - status
  - show a list of options
  - option to pick a location
  - option to pick experience
  - option for the details
  - future iterations I will add more in the future for now we want to get something. -->

### Apt finders NYC

  - craigslist
  - URL:
  - title: #searchform .hdrlnk
  - room size: span class 'housing'
  - neighborhood: class 'pnr'
  - price: class 'price'
  - posted: span class 'txt pl time datetime'
  - daily mailer using 'mail' gem

What I need to get this to work:

Resources:

  - https://www.google.com/search?q=cli+gem&oq=cli+gem+&aqs=chrome..69i57j69i61l2.2575j0j1&sourceid=chrome&ie=UTF-8#q=gem+cli+web+scraper
  - https://www.vikingcodeschool.com/posts/web-scraping-craigslist-with-rubys-mechanize-gem
  - http://kevinquillen.com/programming/2014/06/23/ruby-gets-shit-done
  - https://github.com/danneu/craig/tree/master/lib/craig
  - https://github.com/thebrianemory/nfl-top-stories-cli-gem
  - https://www.icicletech.com/blog/web-scraping-with-ruby-using-mechanize-and-nokogiri-gems

  - The URL I am planning to scrape.
    - *http://newyork.craigslist.org/search/aap*

    created a file in the bin directory called apt_finder, added `#!/usr/bin/env ruby
` so that the computer knows to use a ruby interpeter, changed the executeble file permission on the apt_file and now testing to see if everything works as planned. on  a new line type puts "enter your message"



```
#!/usr/bin/env ruby

puts "hello world"
```

```
./bin/apt_finder
hello world
```

  Getting started building out the Aptartment Finder Gem.

to get started with our gem I use bundler to create some files for us.
type `bundle gem [gem name]` terminal.

the output should look something like this

```
bundle gem apt_finder
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
Initializing git repo in /Users/nin/Development/apt_finder
```





















































# Build a CLI RubyGem with External Data

## Overview

In this lesson you're going to build a RubyGem that provides a command line interface to an external data source. Your code will be packaged as a RubyGem and install a CLI for the user. The CLI will be composed of an Object Oriented Ruby application.

## Requirements

1. Package as a gem.
2. Provide a CLI on gem installation.
3. CLI must provide data from an external source, whether scraped or via a public API.
4. Data provided must go at least a level deep, generally by showing the user a list of available data and then being able to drill into a specific item.
5. The CLI gem can not be a Music CLI gem as that is too similiar to the other OO Ruby final project. Also please refrain from using Kickstarter as that was used for the scraping code along. Look at the example domains below for inspiration

### Example Domains

- Movies Opening Soon - Enter your zip code and receive a list of movies and their details.
- Libraries Near You -  Enter your zip code and receive a list of libraries and their details.
- Programming meetups near you, list details.
- News Reader - List articles, read article.

[now-playing](https://github.com/learn-co-curriculum/now-playing-cli-gem) is an example of a gem that would meet these requirements.
[worlds best restaurants](https://github.com/dannyd4315/worlds-best-restaurants-cli-gem) was built by a Learn student and meets these requirements and is well coded.
Take the time to clone, run and look through the code for both of these in detail - it'll really help.

There is also a [video walkthrough](https://www.youtube.com/watch?v=_lDExWIhYKI) of building a CLI Gem called [Daily Deal](https://github.com/learn-co-curriculum/daily_deal) if you're having a hard time getting started.

## Instructions

1. Create a new repository on GitHub for your gem, ie: `name-cli-gem`.
2. When you create the CLI app for your assessment, add the spec.md file from this repo to the root directory of the project, commit it to Git and push it up to GitHub.
3. Build your gem. Make sure to commit early and commit often. Commit messages should be meaningful (clearly describe what you're doing in the commit) and accurate (there should be nothing in the commit that doesn't match the description in the commit message). Good rule of thumb is to commit every 3-7 mins of actual coding time. Most of your commits should have under 15 lines of code and a 2 line commit is perfectly acceptable. **This is important and you'll be graded on this**.
4. Make sure to create a good README.md with a short description, install instructions, a contributors guide and a link to the license for your code.
5. While you're working on it, record a 30 min coding session with your favorite screen capture tool. During the session, either think out loud or not. It's up to you. You don't need to submit the video, but we may ask for it at a later time.
6. Make sure to check each box in your spec.md (replace the space between the square braces with an x) and explain next to each one how you've met the requirement *before* you submit your project.
7. Prepare a video demo (narration helps!) describing how a user would interact with your working gem.
8. Write a blog post about the project and process.
9. On Learn, submit links to the GitHub repository for your gem, your video demo, and your blog post each to the corresponding textbox in the right rail, and hit "I'm done" to wrap it up.

Unlike the rest of the curriculum, if you have any questions about your assessment or need help with it, please *don’t* use the Ask New Question feature. Rather than working with Learn Experts, please reach out to the Learn Instructor responsible for this section instead - Corinna / corinna@flatironschool.com / learn-co slack: corinna.

## If you're a Learn-Verified Premium student:

Watch for an email from Learn with instructions to schedule an assessment. If you don't receive the email within a day or so after submission, get in touch!

### Be Prepared to:

1. Explain your code from execution point to exit point. We're making sure you wrote it and understand how it works, nothing else. 10-20 minutes
2. Refactor code. 10-20 minutes

If necessary, after the assessment, be prepared to:

1. Extend the application with a new feature, more data, a different domain etc. 20-30 minutes
2. Submit an improved version.

### What to expect from the assessment

- Use the best vocabulary you can. Technical terms allow for you to be more precise which makes conversations about code much easier.
- If you make a mistake, correct yourself! We all make mistakes, I promise.
- Trust yourself.
- Trust us.
- Think on your feet. Feel free to look things up while you're pairing with us. You'll be asked to expand on concepts you implemented and you will be pushed to the edge of your knowledge.
- Explain the details. We're curious!
- You're going to learn a ton. We will give pointers and show you ways to improve your code. This isn't telling you that your code is wrong, it's simply us teaching. Whatever you don't quite understand will be explained.

### What won't happen:

- You won't be told you're ever wrong.
- You won't be yelled at, belittled, or scolded.
- You won't be put on the spot without support.
- There's nothing you can do to instantly fail or blow it.

## Resources

- [How to build a ruby gem](http://guides.rubygems.org/make-your-own-gem/)
- [How to publish your gem](http://guides.rubygems.org/publishing/)
- [Environments, Requiring Files, Bundler, and Gems](https://www.youtube.com/watch?v=XBgZLm-sdl8)
- [Video- CLI Data Gem Walkthrough](https://www.youtube.com/watch?v=_lDExWIhYKI)
- [Video- CLI Data Gem Walkthrough: Creating a CLI Scraper Gem](https://www.youtube.com/watch?v=Y5X6NRQi0bU)
- [Video- Common Anti-Patterns in CLI Data Gem](https://www.youtube.com/watch?v=cbMa87oWv08)
- [Video- Student Example 1: Refactoring CLI Data Gem](https://www.youtube.com/watch?v=JEL_PXr74qQ)
- [Video- Student Example 2: Refactoring CLI Data Gem](https://www.youtube.com/watch?v=Lt0oyHiKWIw)


<p data-visibility='hidden'>View <a href='https://learn.co/lessons/cli-data-gem-assessment'>CLI Data Gem Project</a> on Learn.co and start learning to code for free.</p>