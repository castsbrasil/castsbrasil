source 'http://rubygems.org'

ruby "2.1.2"

gem 'rails', '4.1.8'

gem 'autoprefixer-rails'
gem 'bootstrap-sass', '~> 3.3.1'
gem 'cancancan'
gem 'cocoon'
gem 'compass'
gem 'devise'
gem 'gravatar-ultimate'
gem 'omniauth-github'
gem 'responders'
gem 'rolify'
gem 'sass-rails', '5.0.0'
gem 'simple_form', '>= 3.1.0.rc1'
gem 'therubyracer'
gem 'uglifier', '>= 1.3.0'
gem 'statesman', '~> 0.8.3'
gem 'validates_host'
gem 'zertico', '>= 2.0.0.beta.1'

group :test do
  gem 'capybara'
  gem 'coveralls', require: false
  gem 'database_cleaner'
  gem 'nyan-cat-formatter'
  gem 'rspec-rails'
  gem 'poltergeist'
  gem 'shoulda-matchers', require: false
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
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
