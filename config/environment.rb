require 'bundler'
Bundler.require


ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3', 
  database: 'db/development.db'
)
# ActiveRecord::Base.logger.level = 1
ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger.level = 1 

require 'ruby_figlet'
PROMPT = TTY::Prompt.new
FIGLET = RubyFiglet::Figlet
require_relative '../bin/concerns/find_beer.rb'
require_relative '../bin/concerns/review_beer.rb'
require_relative '../bin/concerns/sort_beer.rb'
require_all 'app'
require 'colorize'
require 'colorized_string'