source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'tabler-rubygem'
gem 'bootstrap'
gem 'rails', '~> 5.2.1'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'dropzonejs-rails'
gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n'
gem 'toastr-rails'
gem 'simple_form'
gem 'jquery-rails'
gem 'will_paginate'
gem 'acts_as_commentable_with_threading'
gem 'trix'
gem 'selectize-rails'
gem 'ancestry'
gem 'omniauth'
gem 'omniauth-facebook', '~> 4.0'
gem 'friendly_id', '~> 5.2.4' 
gem 'mail_form'
gem 'rack-host-redirect'
gem 'smtpapi'
gem 'google-cloud-storage'
gem 'mini_magick'
gem 'active_link_to'
gem 'ransack'
gem 'seed_dump'
gem 'font-awesome-sass'
gem 'jquery-slick-rails'
gem 'activeadmin'
gem 'inherited_resources'
gem 'active_skin'
gem 'acts_as_votable'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
