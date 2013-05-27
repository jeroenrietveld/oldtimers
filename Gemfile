source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.0.rc1'
gem 'bootstrap-sass', '2.3.0.1'
gem 'bcrypt-ruby', '3.0.1'

group :development, :test do
  gem 'rspec-rails', '2.13.1'
  gem 'guard-rspec', '2.5.0'
  gem 'spork-rails', github: 'railstutorial/spork-rails'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.9'
  gem "capistrano"
end

group :test do
  gem 'selenium-webdriver', '2.0'
  gem 'capybara', '2.1.0.rc1'
  gem 'rb-fsevent', '0.9.3', :require => false
  gem 'growl', '1.0.3'
end

group :assets do
  gem 'sass-rails',   '4.0.0.rc1'
  gem 'coffee-rails', '4.0.0'
  gem 'uglifier', '1.0.3'
end

gem 'sqlite3'
gem 'select2-rails'
gem 'jquery-rails', '2.2.1'
gem 'turbolinks', '1.0.0'
gem 'jbuilder', '1.0.1'

group :production do
  gem 'pg', '0.14.1'
end