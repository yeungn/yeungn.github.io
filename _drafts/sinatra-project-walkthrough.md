---
layout: post
title: How to create a Sinatra project from the begining
permalink: /how-to-create-a-sinatra-project-from-the-begining/
date:   2016-10-28 10:53
---

Here is my step by step on creating my Sinatra project

  I am calling my project job_listings for now until I think of a better name.

  Create a new directory from the command line
    `mkdir job_listings` - creates a new directory
    `cd job_listings` - switchs from the current directory over to the new `job_listings` directory

    `git init` - initializes a git repo on my local machine
    `bundle init` - creates a new gemfile

  In github, created a new repository and copied the url given

    ### Picture

    `git remote add origin git@github.com:yeungn/job_listings.git` - links my local git repo to github

  So for the moment, my directory looks like this
    .git (hidden file)
    Gemfile

  Adding the nessecary gems for my project
    source 'http://rubygems.org'
    gem 'sinatra'
    gem 'activerecord', :require => 'active_record'
    gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
    gem 'sqlite3'
    gem 'thin'
    gem 'shotgun' re-reads the application code.
    gem 'bcrypt'
    gem 'tux'
    gem 'pry'
    gem 'rake'
    gem 'require_all' - given a directory path will load all files

  `bundle install`

  config.ru
    require `bundler` - loads gemfile
    Bundler.require - loads gems
    run SinatraApplication

    give it a test. open up the terminal in mac and type rackup config.ru

  lets create a new directory and file config/environment.rb

  set an adapter and tell our program how to connect to the database

  ```
  ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
  )
  ```


  Now I am thinking about tables that I would need
    users
      name
      email
      password
      apply_jobs
      favorite_jobs
    job_listing
      title
      company
      type
      location
      description

  Some features I want in my program
    Search
    Categories
    Types
    User
      create a new user
      user can log in
        can view favorited jobs
          can add additional info. contact name, notes on status, status of application
      user can log out
    Companies
      create a new profile
      list jobs available
      posted date

  Inspired by this recent site GarysGuide.com


How to render textarea text to a formatted text in html


# Fwitter Group Project

## Objectives

1. Build a full scale Sinatra application that uses:

+ A sqlite database
+ ActiveRecord
+ RESTful routes
+ Sessions
+ Login/Logout

## Overview

The goal of this project is to build Fwitter (aka Flatiron Twitter).

You'll be implementing Fwitter using multiple objects that interact, including separate classes for User and Tweet.

Just like with Twitter, a user should not be able to take any actions (except sign-up), unless they are logged in. Once a user is logged in, they should be able to create, edit and delete their own tweets, as well as view all the tweets.

There are controller tests to make sure that you build the appropriate controller actions that map to the correct routes.

## Group Project Instructions

*Instructions for how to work on a Group Project with Learn*

### Some Hints on Working Together

Working on a software project with another person is not something to be taken lightly. While you are a fantastic coder solo, software development is a collaborative activity. Just like anything else, there is skill in collaborating on code. In the end, collaborating with another person boils down to three different styles:

  - Pair - Pair the entire time working linearly together
  - Pass - 1 person does 1 requirement and then the next person does the next one
  - Parallel - work on different parts at the same time by agreeing on interfaces and stubs and meeting in the middle

Remember! The goal at The Flatiron School is not to do, it is to *learn*. Make sure you have worked in all three styles of collaboration. We want you to learn how the different styles works, and make sure that together you and your partner understand every part of the code.

## Instructions

### File Structure

```
├── CONTRIBUTING.md
├── Gemfile
├── Gemfile.lock
├── LICENSE.md
├── README.md
├── Rakefile
├── app
│   ├── controllers
│   │   └── application_controller.rb
│   ├── models
│   │   ├── tweet.rb
│   │   └── user.rb
│   └── views
│       ├── index.erb
│       ├── layout.erb
│       ├── tweets
│       │   ├── create_tweet.erb
│       │   ├── edit_tweet.erb
│       │   ├── show_tweet.erb
│       │   └── tweets.erb
│       └── users
│           ├── create_user.erb
│           └── login.erb
├── config
│   └── environment.rb
├── config.ru
├── db
│   ├── development.sqlite
│   ├── migrate
│   │   ├── 20151124191332_create_users.rb
│   │   └── 20151124191334_create_tweets.rb
│   ├── schema.rb
│   └── test.sqlite
└── spec
    ├── controllers
    │   └── application_controller_spec.rb
    └── spec_helper.rb
```

### Gemfile and environment.rb

This project is supported by Bundler and includes a `Gemfile`.

Run bundle install before getting started on the project.

As this project has quite a few files, an `environment.rb` is included that loads all the code in your project along with Bundler. You do not ever need to edit this file. When you see require_relative `../config/environment`, that is how your environment and code are loaded.

### Models

You'll need to create two models in `app/models`, one `User` model and one `Tweet`. Both classes should inherit from `ActiveRecord::Base`.

### Migrations

You'll need to create two migrations to create the users and the tweets table.

Users should have a username, email, and password, and have many tweets.

Tweets should have content, belong to a user.

### Associations

You'll need to set up the relationship between users and tweets. Think about how the user interacts with the tweets, what belongs to who?


### Home Page

You'll need a controller action to load the home page. You'll want to create a view that will eventually link to both a login page and signup page. The homepage should respond to a GET request to `/`.

### Create Tweet

You'll need to create two controller actions, one to load the create tweet form, and one to process the form submission. The tweet should be created and saved to the database. The form should be loaded via a GET request to `/tweets/new` and submitted via a POST to `/tweets`.

### Show Tweet

You'll need to create a controller action that displays the information for a single tweet. You'll want the controller action respond to a GET request to `/tweets`.

### Edit Tweet

You'll need to create two controller actions to edit a tweet: one to load the form to edit, and one to actually update the tweet entry in the database. The form to edit a tweet should be loaded via a GET request to `/tweets/:id/edit`. The form should be submitted via a POST request to `/tweets/:id`.

You'll want to create an edit link on the tweet show page.

### Delete Tweet

You'll only need one controller action to delete a tweet. The form to delete a tweet should be found on the tweet show page.

The delete form doesn't need to have any input fields, just a submit button.

The form to delete a tweet should be submitted via a POST request to `tweets/:id/delete`.

### Sign Up

You'll need to create two controller actions, one to display the user signup and one to process the form submission. The controller action that processes the form submission should create the user and save it to the database.

The form to sign up should be loaded via a GET request to `/signup` and submitted via a POST request to `/signup`.

The signup action should also log the user in and add the `user_id` to the sessions hash.

Make sure you add the Signup link to the home page.

### Log In

You'll need two more controller actions to process logging in: one to display the form to log in and one to log add the `user_id` to the sessions hash.

The form to login should be loaded via a GET request to `/login` and submitted via a POST request to `/login`.

### Log Out

You'll need to create a controller action to process a GET request to `/logout` to log out. The controller action should clear the session hash

### Protecting The Views

You'll need to make sure that no one can create, read, edit or delete any tweets.

You'll want to create two helper methods `current_user` and `logged_in?`. You'll want to use these helper methods to block content if a user is not logged in.

It's especially important that a user should not be able to edit or delete the tweets created by a different user. A user can only modify their own tweets.

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/sinatra-fwitter-group-project' title='Fwitter Group Project'>Fwitter Group Project</a> on Learn.co and start learning to code for free.</p>
