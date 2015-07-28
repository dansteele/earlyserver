require 'pry'
require './config/environment'
require 'rspec'
require 'rack/test'
require './app/app'

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end