class Beer < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews
  has_and_belongs_to_many :food_pairings
  
#all users who have reviewed the beer
  def user_reviews
    list_of_reviews = self.reviews
    list_of_reviews.map{|review| "User: #{review.user.name}, Rating: #{review.rating}, Review: #{review.description}"}
  end


  #list of how many reviews a beer has
  def review_count
    self.reviews.count
  end
  

  
  def self.sort_beers_by_name_asc
    ordered_beers = self.order(:name)
  end
  
  def self.sort_beers_by_name_desc
    ordered_beers = self.order(name: :desc)
  end

  def self.sort_beers_by_abv_asc(n)
    ordered_beers = self.order(:abv).first(n)
  end

  def self.sort_beers_by_abv_desc(n)
    ordered_beers = self.order(abv: :desc).first(n)
  end


  def self.search_beer_by_name(beer_name)
    matched_beer = Beer.find_by(name: beer_name)
    if matched_beer
      "Name: #{matched_beer.name}, ABV:#{matched_beer.abv}%, Description: #{matched_beer.description}"
    else  
      "No matching results"
    end
  end

  
  def self.search_beer_by_abv(abv_percentage)
    #once user types in beer name, returns data(name, desc, abv)
    #if no matches, return "No matching results"
    within_range = self.where(abv: abv_percentage-1..abv_percentage+1)
    if within_range
      within_range
    else
      "No matching beers for this abv"
    end
  end

  #highest rated beers
  def self.highest_rated_by_avg
    group = Review.group(:beer_id).average(:rating)
    beer_to_avg = group.transform_keys {|k| self.find(k) }
    Hash[beer_to_avg.sort_by {|k,v| -v}[0..4]]
  end

  def highest_review
    self.reviews.order('rating desc').first
  end
  
  #returns random beer
  def self.random
    Beer.all.sample
  end
end