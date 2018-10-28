source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby `cat .ruby-version`.strip

gem 'rails', '~> 5.2.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'

gem 'devise'
gem 'devise_invitable'
gem 'omniauth'
gem 'figaro'

# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'simple_form'
gem 'bootstrap', '~> 4.1.1'
gem 'webpacker'
gem 'sass-rails', '~> 5.0'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'coffee-rails', '~> 4.2'
gem 'uglifier', '>= 1.3.0'
gem 'jbuilder', '~> 2.5'
gem 'haml'
gem 'haml-rails'
gem 'font-awesome-rails'
gem 'react_on_rails'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'selenium-webdriver'
  gem 'factory_bot_rails'
  gem 'email_spec'
  gem 'faker'
  gem 'letter_opener'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
