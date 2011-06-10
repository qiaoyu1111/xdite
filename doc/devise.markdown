---
title: devise
excerpt: 文章摘要。
layout: psy-post
---

rails g -h #查看可以用的devise命令，一般插件的命令都在这里或者在rake -T里面。
rails generate devise:install #
rails generate devise User #
rake db:migrate #
rails g devise:views users #

rails generate devise:install #
===============================================================================

Some setup you must do manually if you haven't yet:

  1. Setup default url options for your specific environment. Here is an
     example of development environment:

       config.action_mailer.default_url_options = { :host => 'localhost:3000' }

     This is a required Rails configuration. In production it must be the
     actual host of your application

  2. Ensure you have defined root_url to *something* in your config/routes.rb.
     For example:

       root :to => "home#index"

  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
     For example:

       <p class="notice"><%= notice %></p>
       <p class="alert"><%= alert %></p>

===============================================================================

rails generate devise User #

	invoke  active_record
	create    app/models/user.rb
	invoke    test_unit
	create      test/unit/user_test.rb
	create      test/fixtures/users.yml
	create    db/migrate/20110610011812_devise_create_users.rb
	insert    app/models/user.rb
	 route  devise_for :users