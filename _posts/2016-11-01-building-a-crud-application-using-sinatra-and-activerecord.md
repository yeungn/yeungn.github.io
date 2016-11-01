---
layout: post
title: Building a CRUD application using Sinatra and ActiveRecord
permalink: /building-a-crud-application-using-sinatra-and-activerecord/
date:   2016-11-01
---

Here are the steps I took to building this Job Listing Sinatra CRUD web application.

  - create a new directory from the command line (mac) - `mkdir job_listings`
  - switch from the current directory over to the new directory - `cd job_listings`
  - initializes a git repo on my local machine - `git init`
  - creates a new gemfile - `bundle init`
  - On my github account I created a new repository

      <img src="/assets/create-a-new-repo-github.png">

  - copied the url

      <img src="/assets/clone-repo-address.png">

  - link the current directory to github

    `git remote add origin git@github.com:yeungn/job_listings.git`

    My directory looks like this

    ```.git (hidden file)
    Gemfile```

  - including the gems I need for this project
  {% highlight ruby %}

  #Gemfile

  source 'http://rubygems.org'
  gem 'sinatra'
  gem 'activerecord', :require => 'active_record'
  gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
  gem 'sqlite3'
  gem 'thin'
  gem 'shotgun' #re-reads the application code.
  gem 'bcrypt'
  gem 'tux'
  gem 'pry'
  gem 'rake'
  gem 'require_all' #given a directory path will load all files
  {% endhighlight %}

  run

  `bundle install`

  {% highlight ruby %}
  # config.ru
    require `bundler` #loads gemfile
    Bundler.require #loads gems

    run SinatraApplication
  {% endhighlight %}

  Now is a good time to test. open up the terminal (mac) and type rackup config.ru

  We can now move that code. Lets create a new directory and file config/environment.rb

  sets an adapter and tell our program how to connect to the database

  {% highlight ruby %}
  ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
  )
  {% endhighlight %}

  Moving on to the next step. I am going to grab the file structure from a previous lab.

```
  ├── Gemfile
  ├── Rakefile
  ├── app
  │   ├── controllers
  │   │   └── application_controller.rb
  │   │   └── jobs_controller.rb
  │   │   └── users_controller.rb
  │   ├── models
  │   │   ├── job.rb
  │   │   └── user.rb
  │   └── views
  │       ├── index.erb
  │       ├── layout.erb
  │       ├── jobs
  │       │   ├── edit.erb
  │       │   ├── new.erb
  │       │   ├── show.erb
  │       │   └── index.erb
  │       └── users
  │           ├── edit.erb
  │           └── login.erb
  │           └── new.erb
  │           └── show.erb
  ├── config
  │   └── environment.rb
  ├── config.ru
  ├── db
  │   ├── development.sqlite
  │   ├── migrate
```

here is what my migration files will look like

{% highlight ruby %}
  create_table :jobs do |t|
    t.string :title
    t.string :company
    t.string :job_type
    t.string :location
    t.text :description
    t.integer :user_id
    t.timestamps
  end

  create_table :users do |t|
    t.string :name
    t.string :email
    t.string :password_digest
  end
{% endhighlight %}



to be continued...

