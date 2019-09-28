require_relative 'boot'

require 'rails/all'
Bundler.require(*Rails.groups)

module Funbox
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = 'Moscow'
    config.active_record.default_timezone = 'Moscow'
    config.active_job.queue_adapter = :sidekiq
  end
end
