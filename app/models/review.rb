class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :beer

  def self.top_five
    self.order('rating desc').limit(5)
  end
end