# frozen_string_literal: true

require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Camaar
  class Application < Rails::Application
    config.load_defaults 7.1

    # Configuration for the application, engines, and railties goes here.
    config.generators.system_tests = nil
  end
end
