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

require 'scepter/rack'

# Gem for applications to automatically post exceptions wherever they'd like (airbrake, db, email, etc)
module Scepter
  
  class << self
    def handle(exception)
      caught_exception = CaughtException.new(exception)
      
    end
  end
  
end