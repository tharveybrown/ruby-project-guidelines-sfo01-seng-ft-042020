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
    array_of_beers_by_avg = Beer.joins(:reviews).group("beers.id").order("avg(reviews.rating) desc").limit(5)
    names = array_of_beers_by_avg.map{|beer| beer.name}
    numbers = array_of_beers_by_avg.map{|beer| beer.get_rating_average.round(1)}
    results = names.zip(numbers)
    results.each do |name, rating|
      puts "Name: #{name}, Average Rating: #{rating}"
    end
  end

  
  
  def self.sort_beers_option
    choices = {'by name' => 1, 'by abv' => 2}
    selection = PROMPT.select("How would you like to sort?", choices)
    
    case selection
    when 1
      options = {'A - Z' => 1, 'Z - A' => 2}
      selection1 = PROMPT.select("How would you like to sort?", options)
      case selection1
      when 1
        self.sort_beers_by_name_asc
      when 2
        self.sort_beers_by_name_desc
      end
    when 2
      options = {'lowest abv' => 1, 'highest abv' => 2}
      selection2 = PROMPT.select("How would you like to sort?", options)
      case selection2
      when 1
        self.sort_beers_by_abv_asc
      when 2
        self.sort_beers_by_abv_desc
      end
    end
  end

  def self.sort_beers_by_name_asc
    ordered_beers = self.order(:name)
    ordered_beers.each_with_index do |beer,index|
      i_plus_one = index +1
      puts "#{i_plus_one}. Name: #{beer.name}, Abv: #{beer.abv}, Description: #{beer.description}"
    end
  end
  
  def self.sort_beers_by_name_desc
    ordered_beers = self.order(name: :desc)
    ordered_beers.each_with_index do |beer,index|
      i_plus_one = index +1
      puts "#{i_plus_one}. Name: #{beer.name}, Abv: #{beer.abv}, Description: #{beer.description}"
    end
  end

  def self.sort_beers_by_abv_asc
    ordered_beers = self.order(:abv)
    ordered_beers.each_with_index do |beer,index|
      i_plus_one = index +1
      puts "#{i_plus_one}. Name: #{beer.name}, Abv: #{beer.abv}, Description: #{beer.description}"
    end
  end

  def self.sort_beers_by_abv_desc
    ordered_beers = self.order(abv: :desc)
    ordered_beers.each_with_index do |beer,index|
      i_plus_one = index +1
      puts "#{i_plus_one}. Name: #{beer.name}, Abv: #{beer.abv}, Description: #{beer.description}"
    end
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
    within_range = self.where(abv: abv_percentage-1..abv_percentage+1)
    if within_range
      within_range
    else
      "No matching beers for this abv"
    end
  end


  def self.highest_rated_by_avg
    group = Review.group(:beer_id).average(:rating)
    beer_to_avg = group.transform_keys {|k| self.find(k).name }
    Hash[beer_to_avg.sort_by {|k,v| v}.reverse]
  end
  
  
  def self.random
    Beer.all.sample
  end
end