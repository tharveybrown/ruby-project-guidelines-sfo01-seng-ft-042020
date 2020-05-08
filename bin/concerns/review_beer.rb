module ReviewBeer
  module ClassMethods
    def select_beer
      puts "What's the name of the beer that would you like to review?"
      beer_name = gets.chomp
      beer = Beer.find_by({name: beer_name})
      if !beer
        find_beer_to_review
      else 
        beer
      end
    end

    def find_beer_to_review
      not_found_msg = "This beer doesn't exist! Would you like to view some random beer names?".colorize(:blue).on_light_red
      find_new_beer = PROMPT.yes?(not_found_msg)
      if find_new_beer
          beer = Beer.random
      else
        !!find_new_beer
      end
    end

    def print_reviews(reviews)
      reviews.map do |review|
        beer = "Beer: #{review.beer.name}"
        rating = "Rating: #{review.rating}"
        description = "Review: #{review.description}"
        created_at = "Created at: #{review.created_at}"
        puts ColorizedString[created_at].colorize(:red) 
        puts ColorizedString[beer].colorize(:light_blue) 
        puts ColorizedString[rating].colorize(:light_yellow) 
        puts ColorizedString[description].colorize(:red) 
        puts " ------ "
      end
    end
  end
end

