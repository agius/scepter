module Scepter
  class CaughtException
    @attributes = :controller, :action, :url, :message, :backtrace, :rails_root, :session, :cookies, :params, :environment
    @attributes.each do |attribute|
      attr_accessor attribute
    end
    
    def initialize(exception, data = {})
      
      controller = data[:controller]
      action = data[:action]
      url = data[:url]
      message = exception.message
      backtrace = exception.respond_to?(:clean_backtrace) ? exception.clean_backtrace : exception.backtrace
      rails_root = Rails.root if defined?(Rails)
    end
    
    def inspect
      attributes = @attributes.collect {|a| "#{a}: #{a.inspect}"}.join(' ')
      "#<Scepter::CaughtException #{attributes}>"
    end
  end
end