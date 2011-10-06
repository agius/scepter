module Scepter
  class Rack
    def initialize(app)
      @app = app
    end

    def call(env)
      begin
        response = @app.call(env)
      rescue Exception => raised
        Scepter.handle(raised, :rack_env => env)
        raise
      end

      if env['rack.exception']
        Scepter.handle(env['rack.exception'], :rack_env => env)
      end

      response
    end
  end
end