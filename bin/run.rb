#!/usr/bin/env ruby

require_relative '../config/environment.rb'
require_relative 'command_line_interface.rb'

# binding.pry
gmail_email = Email.get_gmail
auth = Email.authorize_gmail(gmail_email)
binding.pry
welcome = Welcome.new
user = welcome.welcome_user
Menu.main_menu(user)
