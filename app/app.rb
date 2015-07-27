require 'rack'
require 'rack/server'

class App
  class << self
    def call(env)
      request = Rack::Request.new env
      send_to_target_app request
    end

    def send_to_target_app(request)
      @target_app = request.path.split("/")[1].titleize
      if current_apps.include? @target_app
        @target_app.constantize.new(request: request).to_controller
      else
        raise "First part of path must be a valid controller"
      end
    end

    def current_apps
      ["Techlog"]
    end

  end
end