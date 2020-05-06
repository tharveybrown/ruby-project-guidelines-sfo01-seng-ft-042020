class Beer < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews
  has_and_belongs_to_many :food_pairings
  

  #method to list all users who have reviewed this beer?
  def beer_reviewed_by
  end

  #list of how many reviews a beer has
  def review_count

  end

  #method to give highest rated beers
  def highest_rated

  end

  def self.random
    Beer.all.sample
  end

 

 

end