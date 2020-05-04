require 'rest-client'
require 'pry'
require 'json'
class PunkBeer
  def self.get_data(author)
    url = "https://api.punkapi.com/v2/beers"
    response = RestClient.get(url)
    json_response = JSON.parse(response)
    
    # response_body = response.body
    
    beers = json_response.map do |beer|
      { name: beer["name"], 
        description: beer["description"]
      }
    end
    binding.pry
    # books = json_response["items"].map do |item| 
    #   {description: item["volumeInfo"]["description"],
    #   title: item["volumeInfo"]["title"]}
    # end
    # binding.pry
  end
  
end

PunkBeer.get_data("thea")

# name
# description
# abv
#food_pairing