source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

gem 'bootstrap-sass', '~> 3.0.3.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# activeadmin for administrator functions: sign in, add/edit/delete posts on the home page
# we need to use the version straight from github in order to get rails 4 support
gem 'activeadmin', github: 'gregbell/active_admin'

# better_errors is the shit. trust me.
group :development do
	gem 'sqlite3'
	gem "better_errors"
	gem "binding_of_caller"
end

# markdown parsing for posts
gem 'bluecloth'
gem 'activeadmin_pagedown'

# for validating urls
gem "validate_url"

group :production do
	gem 'rails_12factor'
	gem 'pg'
end

