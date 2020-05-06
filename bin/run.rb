#!/usr/bin/env ruby

require_relative '../config/environment.rb'
require_relative 'command_line_interface.rb'


welcome = Welcome.new
user = welcome.welcome_user
Menu.main_menu(user)
