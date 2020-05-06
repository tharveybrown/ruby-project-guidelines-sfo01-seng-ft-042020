require 'pry'
require 'rest-client'
require 'json'
require_relative '../../config/environment.rb'
require_relative '../models/beer.rb'
require_relative '../models/food_pairing.rb'

class FoodPairingApi
  def self.get_data
    url = "https://api.punkapi.com/v2/beers"
    response = RestClient.get(url)
    json_response = JSON.parse(response)
    
    
    food_pairing_collection = json_response.map do |beer|
      {
        name: beer["name"],
        food_pairings: beer["food_pairing"]
      }
     
    end
    
    
  end
  
end






# food << pairing[:food_pairings].map {|f| f}
# food = food.flatten
# binding.pry
# food_and_beer.each do |pairing|
#   beer_name = pairing[:name]
# end
#   beer_id = Beer.find_by(name: beer_name)
# binding.pry
