
class User < ActiveRecord::Base
  has_many :reviews
  has_many :beers, through: :reviews
  


  def new_review(beer)
    review = Review.create({user_id: self.id})
    puts "What did you think of #{beer.name}? Please add a description:"
    description = gets.chomp
    puts "How would you rate your drink? Enter anything between 1-10"
    rating = gets.chomp.to_f
    Review.update(review.id, description: description, rating: rating, beer_id: beer.id)
  end

  
end


