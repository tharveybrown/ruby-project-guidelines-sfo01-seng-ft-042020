module FindBeer
  module ClassMethods
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
        puts ColorizedString[beer_name].colorize(:light_green)
        puts ColorizedString[beer_abv].colorize(:light_blue)
      end
    end
    
  end
  
  module InstanceMethods

  end
end