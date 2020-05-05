
class User < ActiveRecord::Base
  has_many :reviews
  has_many :beers, through: :reviews


  def new_review(attributes)
    
    user_id = self.id 
    beer_id = attributes[:beer]
    description = attributes[:description]
    rating = attributes[:rating].to_f
    Review.create({
      user_id: user_id, 
      beer_id: beer_id, 
      description: description, 
      rating: rating
      })
  end
  

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

    
  def main_menu
    # prompt = TTY::Prompt.new
    
    choices = {'write a review' => 1, 'find a beer to drink' => 2, 'exit' => 3}
    
    selection = PROMPT.select("Choose your destiny?", choices)
    
    case selection
    when 1
      self.review_beer
    when 2
      self.find_beer
    when 3
      self.exit_program
      
    end
  end


  def review_beer
    beer = self.select_beer
    self.create_review(beer)
    main_menu
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

  def create_review(beer)
    puts "What did you think of #{beer.name}? Please add a description:"
    description = gets.chomp
    puts "How would you rate your drink? Enter anything between 1-10"
    rating = gets.chomp
    self.new_review({description: description, rating: rating, beer: beer})
  end

  def find_beer_to_review
    find_new_beer = PROMPT.yes?("This beer doesn't exist! Would you like to view some random beer names?")
    # binding.pry
    if !find_new_beer
      self.review_beer
    else
      beer = random_beer
    end
  end

  def random_beer
    Beer.all.sample
  end


end


