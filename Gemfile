# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.3.2'

gem 'importmap-rails'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.3'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

gem 'devise', '~> 4.9'
gem 'redis', '>= 4.0.1'

gem 'bootsnap', require: false
gem 'tzinfo-data', platforms: %i[windows jruby]

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[mri windows]
  gem 'erb_lint', '~> 0.5.0'
  gem 'rspec-rails', '~> 6.1'
  gem 'rubocop', '~> 1.61', require: false
  gem 'rubocop-rails', '~> 2.24', require: false
  gem 'rubocop-rspec', '~> 2.27', require: false
  gem 'simplecov', '~> 0.22.0', require: false
end

group :development do
  # gem 'bullet'
  gem 'letter_opener', '~> 1.10'
  # gem 'rack-mini-profiler'
  gem 'web-console'
end

gem 'bootstrap', '~> 5.3'
gem 'sassc-rails', '~> 2.1'
