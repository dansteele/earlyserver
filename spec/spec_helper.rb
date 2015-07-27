require 'pry'
require './config/requires'
require 'rack/test'
include Rack::Test::Methods

RSpec.configure do |config|
  config.mock_with :rspec
  config.expect_with :rspec
  config.raise_errors_for_deprecations!
end

require 'capybara/rspec'
Capybara.configure do |config|
  config.app = Earlymarket::App.new
  config.server_port = 9293
end
