# frozen_string_literal: true

Rails.application.config.assets.version = "1.0"
Rails.application.config.assets.paths << Rails.root.join("vendor", "javascript")
# Precompile additional assets.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
