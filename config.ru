require 'active_record'
use ActiveRecord::ConnectionAdapters::ConnectionManagement
require 'yaml'

ActiveRecord::Base.establish_connection(
  YAML.load(File.read("db/config.yml"))[ENV["RACK_ENV"]]
)

require './config/environment'
require './app/app'

run Earlymarket::Techlog
