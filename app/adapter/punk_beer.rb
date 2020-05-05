require 'rest-client'
require 'pry'
require 'json'

class PunkBeer
  def self.get_data
    url = "https://api.punkapi.com/v2/beers"
    response = RestClient.get(url)
    json_response = JSON.parse(response)
    
    # response_body = response.body
    
    beers = json_response.map do |beer|
      { name: beer["name"], 
        description: beer["description"],
        abv: beer["abv"]
        # food_pairing: beer["food_pairing"]

      }
    end
    
    # books = json_response["items"].map do |item| 
    #   {description: item["volumeInfo"]["description"],
    #   title: item["volumeInfo"]["title"]}
    # end
    # binding.pry
  end
  
end

PunkBeer.get_data

# name
# description
# abv
#food_pairing