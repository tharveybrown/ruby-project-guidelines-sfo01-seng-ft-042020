
class User < ActiveRecord::Base
  has_many :reviews
  has_many :beers, through: :reviews


  def new_review(attributes)
    
    user_id = self.id 
    beer_id = attributes[:beer].id
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
end


