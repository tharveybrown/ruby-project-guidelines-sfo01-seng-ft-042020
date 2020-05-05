# Beer.destroy_all


beers = PunkBeer.get_data
# creates a new instance in Ruby and commits that transaction to the database
# it is running .new + .save together
beers.each do |beer|
  beer = Beer.new(beer)
  beer.save
end

puts "done!"