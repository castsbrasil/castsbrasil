source 'https://rubygems.org'

gem 'rails', '4.1.1'

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

group :development do
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'capybara'
end

group :development, :test do
  gem 'sqlite3'
  gem 'pg'
  gem 'rspec-rails', '~> 3.0.0'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end