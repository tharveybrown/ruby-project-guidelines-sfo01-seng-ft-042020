class Beer < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews
  has_and_belongs_to_many :food_pairings
  

  #method to list all users who have reviewed this beer?
  def user_reviews
    list_of_reviews = self.reviews
    list_of_reviews.map{|review| "User: #{review.user.name}, Rating: #{review.rating}, Review: #{review.description}"}
  end

  

  #list of how many reviews a beer has
  def review_count
    binding.pry
    
  end

  #method to give highest rated beers
  def self.highest_rated
    top_five_obj = Review.order(:rating).limit(5)

    
    puts "Here are our top 5 highest rated beers: #{top_five}"
  end

  #create methods to be able to sort by category(name, abv, rating)
  def sort_beers_by_name
    #list all beers by category, give the user the option for ASC or DESC
    all_by_name = Beer.order(:name)
  end

  def sort_beers_by_abv
    #list all beers by category, give the user the option for ASC or DESC
    all_by_abv = Beer.order(:abv)
  end

  def sort_beers_by_abv
    #list all beers by category, give the user the option for ASC or DESC
    all_by_rating = Review.order(:rating)
  end

  #create methods to be able to search by(name, abv)
  def search_beer_by_name(beer_name)
    #once user types in beer name, returns data(name, desc, abv)
    #set it so that if a user doesn't input full name of beer, would return list of all the beers that include whatever user
    #had input
    #if no matches, return "No matching results"
    matched_beer = Beer.find_by(name: beer_name)
    if matched_beer
      "Name: #{matched_beer.name}, ABV:#{matched_beer.abv}%, Description: #{matched_beer.description}"
    else  
      "No matching results"
    end
  end

  def self.random
    Beer.all.sample
  end

 

  def self.search_beer_by_abv(abv_percentage)
    #once user types in beer name, returns data(name, desc, abv)
    #set it so that if a user doesn't input full name of beer, would return list of all the beers that include whatever user
    #had input
    #if no matches, return "No matching results"
    within_range = self.where(abv: abv_percentage-1..abv_percentage+1)
    if within_range
      within_range
    else
      "No matching beers for this abv"
    end
  end

end