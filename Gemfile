source 'https://rubygems.org'

ruby "#{File.new('.ruby-version').gets}"

gem 'rails', '4.1.4'

gem 'cancancan'

gem 'devise'

gem 'omniauth-github'

gem 'omniauth-facebook'

gem 'omniauth-twitter'

gem 'omniauth-linkedin-oauth2'

gem 'responders'

gem 'rolify'

gem 'simple_form', '>= 3.1.0.rc1'

gem 'therubyracer'

gem 'uglifier', '>= 1.3.0'

group :test do
  gem 'shoulda-matchers', require: false
  gem 'capybara'
  gem 'nyan-cat-formatter'
  gem 'rspec-rails', '~> 3.0.0'
  gem 'spring-commands-rspec'
  gem 'database_cleaner'
  gem 'coveralls', require: false
end

group :development do
  gem 'letter_opener'
end

group :development, :test do
  gem 'sqlite3'
  gem 'guard-rspec'
  gem 'forgery', '0.6.0'
  gem 'factory_girl_rails'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
