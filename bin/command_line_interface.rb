class Welcome 

  def welcome_user
    # puts out a welcome message here!
    welcome_message
    email = get_email
    Menu.progress_bar
    user = find_or_create_user(email)
  end

  def get_email
    puts "enter your email"
    email = gets.chomp 
  end
  
  def find_or_create_user(user_email)
    user = User.find_by(email: user_email)
    if !user 
      sign_up(user_email)
    else  
      puts "Welcome back, #{user.name}"
      user
    end
    # Person.find_by(name: 'Spartacus', rating: 4)
  end

  def sign_up(user_email)
    puts "Cheers! Whats your name?"
    name = gets.chomp
    User.create({ name: name, email: user_email})
  end

  def welcome_message
    puts FIGLET.new("cheers!").to_s  
  end


end


class Menu
  def self.progress_bar
    progressbar = ProgressBar.create(format: "\e[0;34m%t: |%B|\e[0m")
    100.times { progressbar.increment; sleep 0.01 }
    
  end
  def self.main_menu(user)
    # prompt = TTY::Prompt.new
    
    choices = {'write a review' => 1, 'find a beer to drink' => 2, 'view_my_reviews' => 3, 'exit' => 4}
    
    selection = PROMPT.select("Choose your destiny?", choices)
    
    case selection
    when 1
      user.review_beer
    when 2
      beer_selection = find_beer
      
    when 3
      # todo: add my reviews
      user.my_reviews
    when 4
      user.exit_program
    end
  end

  def self.find_beer

    choices = {'find by food pairing' => 1, 'find a beer that I\'ve reviewed' => 2, 'find by abv' => 3}
    selection = PROMPT.select("How would you like to find a beer?", choices)
    case selection
    when 1
      food = select_food
      beer_pairings = FoodPairing.find_beer(food)
      self.progress_bar
      print_suggestion(beer_pairings)
      puts "Leave a review?"
      ## todo leave a review for user and beer or return to main menu if no 
      
    end

  end

  private
  def self.select_food
    foods = FoodPairing.select_random_foods(4)
    choices = foods.map { |element| 
      element[:food]
    }
    selection = PROMPT.select("Select a food to find a suitable beer:", choices)
  end

  def self.print_suggestion(beers)
    beer = beers.sample
    puts "We recommend you try #{beer.name}, abv #{beer.abv}"
    puts "\n"
    puts "Description: #{beer.description}"
    puts "\n"
  end
end