source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'rails', '~> 5.0.4' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'unicorn', '~> 5.1' # HTTP server for Rack applications

gem 'ancestry' #Organise ActiveRecord model into a tree structure
# gem 'bcrypt', '~> 3.1.7' # Use ActiveModel has_secure_password
gem 'browser', '~> 2.5', '>= 2.5.1'# TODO ¿? browser detection with Ruby.
gem 'cancancan', '~> 2.0' # Simple authorization solution for Rails

gem 'ckeditor', '~> 4.2', '>= 4.2.4' #CKEditor is a WYSIWYG editor to be used inside web pages
gem "cocoon" # TODO Unobtrusive nested forms handling, using jQuery. este o nested_forms
gem 'coffee-rails', '~> 4.2' # Use CoffeeScript for .coffee assets and views
# gem 'dalli', '~> 2.7', '>= 2.7.6' # TODO High performance memcached client for Ruby usado en consul
gem 'delayed_job_active_record', '~> 4.1', '>= 4.1.2' # TODO ActiveRecord backend for Delayed::Job, usado en consul
gem 'foundation-rails', '~> 6.4', '>= 6.4.1.2'
gem 'foundation_rails_helper', '~> 3.0' # Rails for zurb foundation CSS framework. Form builder, flash message, ...
gem 'friendly_id', '~> 5.1.0' # TODO ¿?
gem 'i18n_data'
# gem 'initialjs-rails', '0.2.0.1' TODO agendas ¿?
gem 'jbuilder', '~> 2.5' # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jquery-rails' # Use jquery as the JavaScript library
gem "jquery-ui-rails"
gem 'nested_form', '~> 0.3.2' # TODO Gem to conveniently handle multiple models in a single form with Rails 3 and jQuery or Prototype. o cocoon
gem 'pg', '~> 0.21.0' #  Ruby interface to the {PostgreSQL RDBMS}[http://www.postgresql.org/]. It works with {PostgreSQL 9.1 and later}
gem 'pg_search', '~> 2.1', '>= 2.1.1'
gem 'paperclip' # Easy upload management for ActiveRecord
gem 'paranoia', '~> 2.3', '>= 2.3.1' # when you called destroy on an Active Record object that it didn't actually destroy it, but just "hid" the record.
gem 'public_activity', '~> 1.5' # Easy activity tracking for your ActiveRecord models.
gem 'rails-i18n', :git => 'https://github.com/svenfuchs/rails-i18n.git', branch: 'master' # For 4.x
# gem 'ransack', '~> 1.8', '>= 1.8.3'
gem 'responders', '~> 2.4' # A set of Rails responders to dry up your application
gem 'rollbar', '~> 2.15', '>= 2.15.4' # Easy and powerful exception tracking for Ruby
gem 'rubyzip', '~> 1.2', '>= 1.2.1' # is a ruby module for reading and writing zip files
gem 'spreadsheet', '~> 1.1', '>= 1.1.2'
gem 'simple_form', '~> 3.5' # Forms made easy!
gem 'sass-rails', '~> 5.0' # Use SCSS for stylesheets
gem 'savon', '~> 2.11', '>= 2.11.2' # Heavy metal SOAP client
gem 'sidekiq', '~> 5.0', '>= 5.0.5' # Simple, efficient background processing for Ruby
gem 'turbolinks', '~> 5' # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets

group :development, :test do
  gem 'bullet', '~> 5.6', '>= 5.6.1' # help to kill N+1 queries and unused eager loading.
  gem 'byebug', '~> 9.1.0'
  gem 'factory_girl_rails', '~> 4.8.0'
  gem "faker", '~> 1.7.3'
  gem 'i18n-tasks', '~> 0.9.15'
  gem 'letter_opener_web', '~> 1.3.0' # Gives letter_opener an interface for browsing sent emails
  gem 'rubocop', '~> 0.49.1', require: false
  gem 'spring', '~> 2.0.1'
  gem 'spring-commands-rspec', '~> 1.0.4'
end

group :test do
  gem 'capybara', '~> 2.7', '>= 2.7.1'
  gem 'coveralls', '~> 0.8.21', require: false
  gem 'database_cleaner', '~> 1.6.1'
  gem 'email_spec', '~> 2.1.0'
  gem 'poltergeist', '~> 1.15.0'
  gem 'rspec-rails', '~> 3.6'
end

group :development do
  gem 'capistrano', '~> 3.9', '>= 3.9.1', require: false
  gem 'capistrano-bundler', '~> 1.3', require: false
  gem 'capistrano-rails', '~> 1.3', require: false
  gem 'capistrano-rvm', '~> 0.1.2' # TODO cer que gema utilizar, esta es la mas antigua
#  gem 'rvm-capistrano', '~> 1.5', '>= 1.5.6' # TODO revisar despliegues con esta gema
#  gem 'rvm1-capistrano3', '~> 1.4' # TODO revisar despliegues con esta gema
#  gem 'capistrano3-delayed-job', '~> 1.7.3'
  gem 'mdl', '~> 0.4.0', require: false
  gem 'rvm1-capistrano3', '~> 1.4.0', require: false
  gem 'scss_lint', '~> 0.54.0', require: false
  gem 'web-console', '~> 3.5', '>= 3.5.1'
  gem 'listen', '~> 3.0.5'
#  gem 'spring-watcher-listen', '~> 2.0.0' TODO es de agendas usar?
end
