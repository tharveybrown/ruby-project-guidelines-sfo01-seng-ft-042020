class FoodPairing < ActiveRecord::Base
  has_and_belongs_to_many :beers

  def self.select_random_foods(n)
    self.all.shuffle[0..n]
  end

  def self.find_beer(food_name)
    food = self.find_by(food: food_name)
    food.beers
  end

end