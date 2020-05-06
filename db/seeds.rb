
# remove data from tables at runtime
Beer.destroy_all
User.destroy_all
FoodPairing.destroy_all
Review.destroy_all



#Beer Table
beers = PunkBeer.get_data

beers.each do |beer|
  beer = Beer.new(beer)
  beer.save
end

# Map food pairing to Beer Id
food_and_beer_id = FoodPairingApi.get_data.map do |pairing|
  beer_name = pairing[:name]
  beer_id = Beer.find_by(name: beer_name)[:id]
  {beer: beer_id, food_pairings: pairing[:food_pairings]}
end

# FoodPairing table, then insert each food item to corresponding beer
food_and_beer_id.each do |h|  
  beer = Beer.find_by_id(h[:beer])
  food_list = h[:food_pairings]
  food_list.each do |item|
    food = FoodPairing.new(food: item)
    food.save
    beer.food_pairings << food
  end
end

#User Table
20.times do 
  User.create({
    name: Faker::FunnyName.three_word_name,
    email: Faker::Internet.email
  })
end



#Review Table.. 
#use "hipster sentences" from faker to generate descriotions

20.times do 
  Review.create({user_id: User.all.sample.id, 
            beer_id: Beer.all.sample.id,
            rating: rand(0.0..10.0),
            description: Faker::Hipster.sentences
            }
          )
end

puts "done!"