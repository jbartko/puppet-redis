source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : ['>= 3.2']

gem 'puppet', puppetversion
gem 'puppetlabs_spec_helper'

group :test do
  gem 'rake'
  gem 'puppet-lint'
  gem 'rspec-puppet'
end

# vim: set ts=2 sw=2 et ft=ruby:
