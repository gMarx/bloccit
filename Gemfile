source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'

# #1
group :production do
  # production will deploy to Heroku, which only supports a postrgres db. Use Postgres
  gem 'pg'
#   asset pipeline in Heroku:
  gem 'rails_12factor'
end

# #2
group :development do
  # sqlite3 is easy to use db, perfect for local env usage.
  gem 'sqlite3'
  # add ap for terminal use (upgrade to pp)
  gem 'awesome_print', :require => 'ap'
end

group :development, :test do
#   RSPEC for testing
  gem 'rspec-rails', '~> 3.0'
  gem 'shoulda'
#   NyanCat, for fun!
  gem 'nyan-cat-formatter'
#   pry for testing
  gem 'pry-rails'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'bootstrap-sass'
gem 'bcrypt'
gem 'figaro', '1.0'
gem 'factory_girl_rails', '~> 4.0'
