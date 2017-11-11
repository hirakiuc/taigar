source 'https://rubygems.org'

# Specify your gem's dependencies in taigar.gemspec
gemspec

gem 'yard'
gem 'yardstick'

group :development, :test do
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rescue'
  gem 'pry-stack_explorer'

  gem 'gem-release'
  gem 'rubocop', '~> 0.50.0', require: false
end

group :test do
  gem 'rspec-mocks'
  gem 'simplecov', require: false
  gem 'webmock'
end
