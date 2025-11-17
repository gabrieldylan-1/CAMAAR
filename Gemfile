source "https://rubygems.org"

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.3.0"

gem "rails", "~> 7.1.3", ">= 7.1.3.2"
gem "pg", "~> 1.5"
gem "puma", "~> 6.4"
gem "turbo-rails"
gem "stimulus-rails"
gem "importmap-rails"
gem "jbuilder"
gem "sprockets-rails"
gem "bootsnap", ">= 1.16.0", require: false
gem "redis", "~> 5.0"

group :development, :test do
  gem "debug", ">= 1.0.0", "< 2.0.0"
  gem "cucumber-rails", require: false
  gem "database_cleaner-active_record"
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "rspec-expectations"
end

group :development do
  gem "web-console"
  gem "listen", "~> 3.7"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "simplecov", require: false
end

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
