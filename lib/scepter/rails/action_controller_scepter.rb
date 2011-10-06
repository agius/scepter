module Scepter
  module Rails
    module ActionControllerScepter

      # Sets up an alias chain to catch exceptions when Rails does
      def self.included(base) #:nodoc:
        base.send(:alias_method, :rescue_action_in_public_without_scepter, :rescue_action_in_public)
        base.send(:alias_method, :rescue_action_in_public, :rescue_action_in_public_with_scepter)
      end

      private

      # Overrides the rescue_action method in ActionController::Base, but does not inhibit
      # any custom processing that is defined with Rails 2's exception helpers.
      def rescue_action_in_public_with_scepter(exception)
        $stderr.puts "Handling exception with scepter"
        Scepter.handle(exception, scepter_request_data)
        rescue_action_in_public_without_scepter(exception)
      end
      
      def scepter_request_data
        { :parameters       => params.to_hash,
          :session_data     => session.respond_to?(:to_hash) ? session.to_hash : session.data,
          :controller       => params[:controller],
          :action           => params[:action],
          :url              => url = "#{request.protocol}#{request.host}:#{request.port}#{request.fullpath}",
          :cgi_data         => request.env }
      end
    end
  end
end