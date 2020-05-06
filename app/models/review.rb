class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :beer

  def self.top_reviews
    Review.order(rating: :desc)
  end

  
end
