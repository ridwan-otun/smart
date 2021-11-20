# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby '~> 3.0.0'

group :development do
  gem 'bundler-audit'
  gem 'rubocop'
  gem 'rubocop-performance'
end

grout :test do
  gem 'rspec', '~> 3.9'
  gem 'rspec_junit_formatter'
  gem 'simplecov', '< 0.18.0', require: false
end
