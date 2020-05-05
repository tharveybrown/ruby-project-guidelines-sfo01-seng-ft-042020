
class User < ActiveRecord::Base
  has_many :reviews
  has_many :beers, through: :reviews
  

  #create methods to be able to sort by category(name, abv, rating)
  def sort_beers_by_category(category)
    #list all beers by category, give the user the option for ASC or DESC
  end

  #create methods to be able to search by(name, abv)
  def search_beer_by_name(beer_name)
    #once user types in beer name, returns data(name, desc, abv)
    #set it so that if a user doesn't input full name of beer, would return list of all the beers that include whatever user
    #had input
    #if no matches, return "No matching results"
  end

  


  def review_beer
    beer = self.select_beer
    new_review(beer)
    Menu.main_menu(self)
  end

  def find_beer
    puts ""
    choices = {'write a review' => 1, 'find a beer to drink' => 2, 'exit' => 3}
  end 

  def exit_program
    puts "Bye for now!"
    exit
  end

  def select_beer
    puts "What's the name of the beer that would you like to review?"
    beer_name = gets.chomp
    beer = Beer.find_by({name: beer_name})
    if !beer
      beer = self.find_beer_to_review
    else 
      beer
    end
  end

  def new_review(beer)
    review = Review.create({user_id: self.id})
    puts "What did you think of #{beer.name}? Please add a description:"
    description = gets.chomp
    puts "How would you rate your drink? Enter anything between 1-10"
    rating = gets.chomp.to_f
    # binding.pry
    Review.update(review.id, description: description, rating: rating, beer_id: beer.id)
  end

  def find_beer_to_review
    find_new_beer = PROMPT.yes?("This beer doesn't exist! Would you like to view some random beer names?")
    # binding.pry
    if !find_new_beer
      self.review_beer
    else
      beer = Beer.random
    end
  end

  def my_reviews
    puts self.reviews
    Menu.main_menu(self)
  end
end


