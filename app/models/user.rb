
class User < ActiveRecord::Base
  has_many :reviews
  has_many :beers, through: :reviews
  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  


  def new_review(beer)
    review = Review.create({user_id: self.id})
    puts "What did you think of #{beer.name}? Please add a description:"
    description = gets.chomp
    puts "How would you rate your drink? Enter anything between 1-10"
    rating = gets.chomp.to_f
    Review.update(review.id, description: description, rating: rating, beer_id: beer.id)
  end

  def find_beer_to_review
    find_new_beer = PROMPT.yes?("This beer doesn't exist! Would you like to view some random beer names?")
    if !find_new_beer
      self.review_beer
    else
      beer = Beer.random
    end
  end

  def my_reviews
    #it would be cool to maybe add a timestamp of when the review was created
    review_obj = self.reviews
    review_obj.map {|review|  puts "Beer: #{review.beer.name} , Rating: #{review.rating}, Review: #{review.description}"}
  end

  
end


