source 'http://rubygems.org'

ruby "2.3.1"

gem 'rails', '4.2.5'

gem 'autoprefixer-rails'
gem 'bootstrap-sass', '~> 3.3.7'
gem 'cancancan'
gem 'cocoon'
gem 'compass'
gem 'devise'
gem 'gravatar-ultimate'
gem 'omniauth-github'
gem 'responders', '~> 2.3.0'
gem 'rolify'
gem 'sass-rails', '5.0.4'
gem 'simple_form', '>= 3.1.0.rc1'
gem 'therubyracer'
gem 'uglifier', '>= 3.0.1'
gem 'statesman', '~> 2.0.1'
gem 'validates_host'
gem 'redcarpet', '>=3.3.2'
gem 'auto_html', '1.6.4'
gem 'friendly_id', '~> 5.1.0'

group :test do
  gem 'capybara'
  gem 'coveralls', '>=0.8.0', require: false
  gem 'database_cleaner'
  gem 'nyan-cat-formatter'
  gem 'rspec-rails'
  gem 'poltergeist'
  gem 'shoulda-matchers', '2.8.0', require: false
  gem 'spring-commands-rspec'
end

group :development do
  gem 'letter_opener'
  gem 'brakeman', require: false
  gem 'bullet'
  gem 'better_errors'
end

group :development, :test do
  gem 'jazz_hands', github: 'nixme/jazz_hands', branch: 'bring-your-own-debugger'
  gem 'factory_girl_rails'
  gem 'guard-rspec'
  gem 'sqlite3'
  gem 'dotenv-rails'
  gem 'ffaker'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
