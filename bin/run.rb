#!/usr/bin/env ruby

require_relative '../config/environment.rb'
require_relative 'command_line_interface.rb'


welcome = Welcome.new
email = welcome.get_email
user = welcome.find_or_create_user(email)

Menu.main_menu(user)



# menu = Menu.new
# choice = menu.choose_what_to_do(user)

binding.pry
