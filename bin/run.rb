#!/usr/bin/env ruby

require_relative '../config/environment.rb'
require_relative 'command_line_interface.rb'

puts "HELLO WORLD"

welcome = Welcome.new

user = welcome.welcome_user

Menu.main_menu(user)
Menu.find_beer


# menu = Menu.new
# choice = menu.choose_what_to_do(user)

# binding.pry
