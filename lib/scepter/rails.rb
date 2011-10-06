require 'scepter'
require 'airbrake/rails/action_controller'

module Scepter
  module Rails
    def self.initialize
      if defined?(ActionController::Base)
        ActionController::Base.send(:include, Scepter::Rails::ActionControllerScepter)
      end

      if defined?(::Rails.configuration) && ::Rails.configuration.respond_to?(:middleware)
        ::Rails.configuration.middleware.insert_after 'ActionController::Failsafe', Scepter::Rack
      end
    end
  end
end

Scepter::Rails.initialize