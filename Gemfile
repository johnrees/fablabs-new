ruby '2.1.2'
source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0.beta1'
# Use postgresql as the database for Active Record
gem 'airbrake'
gem 'pg'
gem 'figaro', github: 'laserlemon/figaro'
# Use SCSS for stylesheets
gem 'simple_form', github: 'plataformatec/simple_form'
gem 'sass-rails', '~> 5.0.0.beta1'
gem 'bourbon'
gem 'neat'
gem 'normalize-rails'
gem 'date_validator'
# gem 'bitters'
# gem 'refills'

gem 'workflow', github: 'geekq/workflow'

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
gem 'haml-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Rails Html Sanitizer for HTML sanitization
gem 'rails-html-sanitizer', '~> 1.0'

gem 'pundit'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'brakeman'
end

group :test do
  gem 'simplecov', require: false
  gem 'zonebie'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'database_cleaner'
  gem "codeclimate-test-reporter", require: nil
end

group :development do
  gem 'ruby-graphviz', '~> 1.0.0'
  gem 'guard-rspec', require: false
  gem 'letter_opener'
end

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'debugger' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exceptions page and /console in development
  gem 'web-console', '~> 2.0.0.beta2'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

