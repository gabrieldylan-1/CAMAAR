ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  parallelize(workers: :number_of_processors, with: :threads)
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all if Dir.exist?(Rails.root.join("test", "fixtures"))
end
