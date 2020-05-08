class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :beer

  def self.top_reviews(n)
    top_n_reviews = self.order('rating desc').limit(n)
  end

  def self.print_reviews(reviews)
    
    reviews.map do |review|
      beer_name = Beer.find(review.beer_id).name 
      desc = review.description
      rating = review.rating.round(2)
      created_at = "Created at: #{review.created_at}".underline
      puts ColorizedString[created_at].colorize(:red)
      print "Beer:".colorize(:light_blue).underline
      print " #{beer_name}\n".colorize(:light_blue) 
      print "Description:".colorize(:red).underline
      print " #{desc}\n".colorize(:red) 
      print "Rating:".colorize(:light_green).underline
      print " #{rating}".colorize(:light_green)
      puts "\n-----"
    end  
  end

  
end
