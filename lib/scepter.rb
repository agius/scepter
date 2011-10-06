require 'net/http'
require 'net/https'
require 'rubygems'
begin
  require 'active_support'
  require 'active_support/core_ext'
rescue LoadError
  require 'activesupport'
  require 'activesupport/core_ext'
end

require 'scepter/caught_exception'
require 'scepter/rack'

if defined?(ActionController::Base)
  require 'scepter/rails/action_controller_scepter.rb'
  ActionController::Base.send(:include, Scepter::Rails::ActionControllerScepter) 
end

# Gem for applications to automatically post exceptions wherever they'd like (airbrake, db, email, etc)
module Scepter
  
  class << self
    def handle(exception, data)
      caught_exception = CaughtException.new(exception, data)
    end
  end
  
end