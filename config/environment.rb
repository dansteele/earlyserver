require 'active_record'
require 'yaml'
require 'pry'
ENV['RACK_ENV'] ||= 'test'

ActiveRecord::Base.establish_connection(
  YAML.load(File.read("./db/config.yml"))[ENV["RACK_ENV"]]
)


Dir[File.expand_path('../../lib/**/*.rb', __FILE__)].each do |f|
  require f
end

require './app/controllers/ApplicationController'

Dir[File.expand_path('../../app/**/*.rb', __FILE__)].each do |f|
  require f
end

Dir[File.expand_path('../../app/**/**/*.rb', __FILE__)].each do |f|
  require f
end

Dir[File.expand_path('../../models/*.rb', __FILE__)].each do |f|
  require f
end

Dir[File.expand_path('../../fixtures/*.rb', __FILE__)].each do |f|
  require f
end

require './app/app'