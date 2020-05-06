
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
