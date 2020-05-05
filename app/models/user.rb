
class User < ActiveRecord::Base
  has_many :reviews
  has_many :beers, through: :reviews

  def new_review(attributes)
    user_id = self.id 
    beer_id = attributes[:beer].id
    description = attributes[:description]
    rating = attributes[:rating].to_f
    review = Review.create(user_id: user_id, beer_id: beer_id, description: description, rating: rating)
  end
end


