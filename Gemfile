# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby '~> 3.0.0'

group :development, :test do
  gem 'bundler-audit'
  gem 'rspec', '~> 3.9'
  gem 'rspec_junit_formatter'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'simplecov', '< 0.18.0', require: false
end
