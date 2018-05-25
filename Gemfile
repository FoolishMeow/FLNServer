source 'https://gems.ruby-china.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Neo4j as the database for ActiveNode
gem 'neo4j', '~> 9.1', '>= 9.1.2'
gem 'neo4j-rake_tasks', '~> 0.7.18'
gem 'rack-utf8_sanitizer'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# For Cross Origin
gem 'rack-cors'
# Use Redis adapter to run Action Cable in production
gem 'sidekiq', '~> 5'

gem 'force_layout', github: 'FoolishMeow/ForceLayout'
# Use dotenv for envs
gem 'dotenv-rails', require: 'dotenv/rails-now'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Call 'binding.pry' anywhere in the code to stop execution and get a debugger console
  gem 'pry-byebug'

  # For deployment
  gem 'capistrano', '3.10.2', require: false
  gem 'capistrano-bundler',  require: false
  gem 'capistrano-db-tasks', require: false
  gem 'capistrano-rails',    require: false
  gem 'capistrano-rvm',    require: false
  gem 'capistrano-sidekiq',  require: false
  gem 'capistrano3-puma',    require: false

  gem 'terminal-notifier-guard' # This need terminal-notifier, brew install it
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # DB structure
  gem 'annotate'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
