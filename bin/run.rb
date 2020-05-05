#!/usr/bin/env ruby

require_relative '../config/environment.rb'
require_relative 'command_line_interface.rb'

puts "HELLO WORLD"
welcome = Welcome.new
email = welcome.get_email
user = welcome.find_or_create_user(email)

menu = Menu.new
choice = menu.choose_what_to_do

binding.pry
## TODO
# welcome = Welcome.new
# welcome.get_email