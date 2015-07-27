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
      @target_app.constantize.new(request: request)
    end
  end
end