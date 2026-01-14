source "https://rubygems.org"

ruby "3.3.7"

gem "rails", "~> 7.1.3"

gem "pg", "~> 1.1"

gem "puma", ">= 5.0"

gem 'sprockets-rails'
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"

gem 'redis'
gem 'sidekiq'

gem "jbuilder"

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem "bootsnap", require: false

group :development, :test do
  gem 'debug', platforms: %i[mri windows]
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'faker'
  gem 'byebug'
  gem 'timecop'
end

group :development do
  gem 'web-console'
  gem 'error_highlight', '>= 0.4.0', platforms: [:ruby]
end

group :test do
  gem 'webmock'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
  gem 'launchy'
  gem 'rails-controller-testing'
  gem 'guard-rspec'
  gem 'database_cleaner-active_record'
end
