require_relative 'config/environment.rb'
require 'sinatra/activerecord/rake'

desc 'starts a console'
task :console do
  
  ActiveRecord::Base.logger = Logger.new(STDOUT)
  ActiveRecord::Base.logger.level = 0
  Pry.start
end

