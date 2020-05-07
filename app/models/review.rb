class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :beer
  validates :rating, length: { in: 1..5 }

  def self.top_reviews
    Review.order(rating: :desc)
  end


end
