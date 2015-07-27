require 'active_record'
use ActiveRecord::ConnectionAdapters::ConnectionManagement
require 'yaml'

ActiveRecord::Base.establish_connection(
  YAML.load(File.read("db/config.yml"))[ENV["RACK_ENV"]]
)

require './app/app'

Dir[File.expand_path('app/**/*.rb', __FILE__)].each do |f|
  require f
end

Dir[File.expand_path('models/*.rb', __FILE__)].each do |f|
  require f
end

run Earlymarket::Techlog
