# frozen_string_literal: true

Rails.application.config.after_initialize do
  Rack::MiniProfiler.config.max_traces_to_show = 100 if defined?(Rack::MiniProfiler)
end
