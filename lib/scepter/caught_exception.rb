module Scepter
  class CaughtException
    @attributes = :controller, :request, :exception, :host, :backtrace, :rails_root, :data, :sections, :session, :cookies, :params
    attr_accessor @attributes
    
    def initialize(exception, data = {})
      backtrace = exception.respond_to?(:clean_backtrace) ? exception.clean_backtrace : exception.backtrace
      $stderr.puts ENV
      $stderr.puts data
    end
    
    def inspect
      attributes = @attributes.collect {|a| "#{a}: #{a.inspect}"}.join(' ')
      "#<Scepter::CaughtException #{attributes}>"
    end
  end
end