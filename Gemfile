# frozen_string_literal: true

source 'https://rubygems.org'
ruby '2.5.0'

# Rails
gem 'draper', '~> 3.0', '>= 3.0.1'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.2.2'
gem 'rails-observers'
gem 'bootsnap', '>= 1.1.0', require: false

# Model / DB
gem 'pg'

group :development, :test do
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'rubocop'
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]