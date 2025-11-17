# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"

require "simplecov" if ENV["COVERAGE"]
require File.expand_path("../../config/environment", __dir__)
abort("The Rails environment is running in production mode!") if Rails.env.production?

require "cucumber/rails"
require "rspec/expectations"
require "database_cleaner/active_record"

ActionController::Base.allow_rescue = false

DatabaseCleaner.strategy = :transaction
Cucumber::Rails::Database.autorun_database_cleaner = false
Cucumber::Rails::Database.javascript_strategy = :truncation

Before do
  DatabaseCleaner.start
end

After do
  DatabaseCleaner.clean
end

World(RSpec::Matchers)

Capybara.default_driver = :rack_test
Capybara.javascript_driver = :selenium_chrome_headless
Capybara.server = :puma, { Silent: true }
