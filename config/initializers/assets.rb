# frozen_string_literal: true

Rails.application.config.assets.version = '1.0'
# Rails.application.config.assets.paths << Emoji.images_path
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w[bootstrap.min.js popper.js]
