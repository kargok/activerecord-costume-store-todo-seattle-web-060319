require 'bundler/setup'
Bundler.require

require 'rake'
require 'active_record'
require 'yaml/store'
require 'ostruct'
require 'date'
require_relative '../app/models/costume_store'
require_relative '../app/models/costume'
require_relative '../app/models/haunted_house'

DBNAME = "halloween"

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/support", "*.rb")].each {|f| require f}

DBRegistry[ENV["ACTIVE_RECORD_ENV"]].connect!
DB = ActiveRecord::Base.connection

if ENV["ACTIVE_RECORD_ENV"] == "test"
  ActiveRecord::Migration.verbose = false
end
