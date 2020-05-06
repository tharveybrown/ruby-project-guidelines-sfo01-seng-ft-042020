class Beer < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews
  has_and_belongs_to_many :food_pairings
  

  #method to list all users who have reviewed this beer?
  def user_reviews
    list_of_reviews = self.reviews
    list_of_reviews.map{|review| "User: #{review.user.name}, Rating: #{review.rating}, Review: #{review.description}"}
  end

  def get_rating_average
    list_of_reviews = self.reviews
    list_of_reviews.map{|review| review.rating}.sum/review_count
    
  end

  #list of how many reviews a beer has
  def review_count
    self.reviews.count
  end
  
#method to give highest rated beers
  def self.highest_rated
    # binding.pry
    array_of_beers_by_avg = Beer.joins(:reviews).group("beers.id").order("avg(reviews.rating) desc")
    names = array_of_beers_by_avg.map{|beer| beer.name}
    numbers = array_of_beers_by_avg.map{|beer| beer.get_rating_average}
    results = names.zip(numbers)
    results.each do |name, rating|
      puts "Name: #{name}, Average Rating: #{rating}"
    end
  end

  #create methods to be able to sort by category(name, abv, rating)
  def self.sort_beers_by_name_asc
    #list all beers by category, give the user the option for ASC or DESC
    self.order(:name)
  end

  def self.sort_beers_by_name_desc
    self.order(name: :desc)
  end

  def self.sort_beers_by_abv_asc
    #list all beers by category, give the user the option for ASC or DESC
    self.order(:abv)
  end

  def self.sort_beers_by_abv_desc
    #list all beers by category, give the user the option for ASC or DESC
    self.order(abv: :desc)
  end


  #create methods to be able to search by(name, abv)
  def self.search_beer_by_name(beer_name)
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

  
  def self.search_beer_by_abv(abv_percentage)
    #once user types in beer name, returns data(name, desc, abv)
    #set it so that if a user doesn't input full name of beer, would return list of all the beers that include whatever user
    #had input
    #if no matches, return "No matching results"
    results = Beer.where("abv = ?", abv_percentage)
    array_of_results = results.map{|beer| "Name: #{beer.name}, ABV:#{beer.abv}%, Description: #{beer.description}"}
    if results
      array_of_results
    else
      "No matching results"
    end
  end
  
  
  def self.random
    Beer.all.sample
  end
end