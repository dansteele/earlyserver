require 'rack'
require 'rack/server'

class App
  attr_accessor :request

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
        raise "First part of path must be a valid app. #{@target_app} is not an app."
      end
    end

    def current_apps
      ["Techlog"]
    end

  end

  def initialize(obj)
    @request = obj[:request]
    @request[:ids] = retrieve_ids
    @response = Rack::Response.new
  end

  def to_controller
    to_controller_name(get_controller_name).new(request: request).invoke_action
  end

  def get_controller_name
    useful_path.find_last_word
  end

  def useful_path
    @request.path.split("/")[2..-1]
  end

  def retrieve_ids
    useful_path.select.with_index do |item, index|
      if item.is_i?
        return {useful_path[index-1].to_sym => item} 
      end
    end
  end

  def to_controller_name word
    (word.titleize + "Controller").constantize
  end

  def invoke_action
    # Assuming GET for now.
    # Header checks will go here.
    if useful_path.last.is_i?
      self.send "show", @request[:ids]
    else
      self.send "index"
    end
  end


  def show(*args)
    @response.status = 200
    # Set headers
    # etc
    @response
  end

  def index(*args)
    @response.status = 200
    # Set headers
    # etc
    @response
  end
end