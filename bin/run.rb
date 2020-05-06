#!/usr/bin/env ruby

require_relative '../config/environment.rb'
require_relative 'command_line_interface.rb'


welcome = Welcome.new
email = welcome.get_email
user = welcome.find_or_create_user(email)

Menu.main_menu(user)
# review1 = Review.create(user_id: 1,beer_id: 1, rating: 6.0, description: "Awesome")
# review1 = Review.create(user_id: 1,beer_id: 2, rating: 10.0, description: "Awesome")
# review1 = Review.create(user_id: 1,beer_id: 2, rating: 10.0, description: "Awesome")
# review1 = Review.create(user_id: 1,beer_id: 3, rating: 6.0, description: "Awesome")
# review1 = Review.create(user_id: 1,beer_id: 4, rating: 2.0, description: "Awesome")
# review1 = Review.create(user_id: 1,beer_id: 2, rating: 10.0, description: "Awesome")


binding.pry
