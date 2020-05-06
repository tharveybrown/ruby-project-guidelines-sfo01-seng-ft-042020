# Beer.destroy_all

Beer.destroy_all
User.destroy_all
FoodPairing.destroy_all
Review.destroy_all
# Beer_Food_Pairing.destroy_all


beers = PunkBeer.get_data
# creates a new instance in Ruby and commits that transaction to the database
# it is running .new + .save together
beers.each do |beer|
  beer = Beer.new(beer)
  beer.save
end

food_and_beer_id = FoodPairingApi.get_data.map do |pairing|
  beer_name = pairing[:name]
  beer_id = Beer.find_by(name: beer_name)[:id]
  {beer: beer_id, food_pairings: pairing[:food_pairings]}

end


food_and_beer_id.each do |h|
  
  beer = Beer.find_by_id(h[:beer])
  food_list = h[:food_pairings]
  food_list.each do |item|
    food = FoodPairing.new(food: item)
    food.save
    beer.food_pairings << food
  end
end

puts "done!"