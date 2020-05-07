module FindBeer
  module ClassMethods
    def find_beer
      choices = {'find by food pairing' => 1, 'find highest rated beers' => 2, 'find by abv' => 3}
      selection = PROMPT.select("How would you like to find a beer?", choices)
      self.progress_bar
      case selection
      when 1
        food = select_food
        beer_pairings = FoodPairing.find_beer(food)
        self.progress_bar
        print_suggestion(beer_pairings)
      when 2 
        top_beers = Beer.highest_rated_by_avg
        print_ratings(top_beers)
      when 3 
        self.find_by_abv
      end
    end

    def find_by_abv
      puts  "Enter the abv value that you'd like to search by."
      puts "We'll list a few beers within that range."
      abv = gets.chomp.to_f
      beers = Beer.search_beer_by_abv(abv)
      print_beers(beers)
    end

    def print_beers(beers)
      beers.map do |beer|
        beer_name = "Beer: #{beer[:name]}"
        beer_abv = "ABV: #{beer[:abv]}"
        beer_tagline = "Tagline: #{beer[:tagline]}"
        beer_description = "Description: #{beer[:description]}"
        puts beer_name.colorize(:light_green)
        puts beer_abv.colorize(:pink)
        puts beer_tagline.colorize(:light_blue)
        puts beer_description.colorize(:light_white)
        puts "-----"
      end
    end

    def print_ratings(beers)
      beers.each_with_index do |(k, v), index|
        i_plus_one = index +1
        beer_name = "Beer: #{k}"
        beer_rating = "Avg Rating: #{v.round(1)}"
        puts "#{i_plus_one}."
        puts ColorizedString[beer_name].colorize(:light_blue)
        puts ColorizedString[beer_rating].colorize(:light_green)
      beers.each do |k, v|
        beer_name = "Beer: #{k[:name]}"
        beer_rating = "Avg Rating: #{v.round(2)}"
        beer_tagline = "Tagline: #{k[:tagline]}"
        puts beer_name.colorize(:light_blue)
        puts beer_rating.colorize(:light_green)
        puts beer_tagline.colorize(:cyan)
        puts "-----"
      end
    end
    
    def select_food
      foods = FoodPairing.select_random_foods(4)
      choices = foods.map { |element| 
        element[:food]
      }
      selection = PROMPT.select("Select a food to find a suitable beer:", choices)
    end

    def print_suggestion(beers)
      beer = beers.sample
      print"We recommend you try: ".colorize(:light_magenta)
      print "#{beer.name}, abv #{beer.abv}".colorize(:light_magenta).on_light_white 
      puts "\n"
      puts "Tagline: #{beer.tagline}".colorize(:light_yellow)
      puts "Description: #{beer.description}".colorize(:light_white)
      puts "\n"
    end  
  end
  
end