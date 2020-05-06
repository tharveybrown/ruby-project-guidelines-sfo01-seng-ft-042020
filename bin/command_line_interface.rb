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
      puts "\nWelcome back, #{user.name}"
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
    # puts ColorizedString.color_samples  
    beers = Emoji.find_by_alias("beers").raw
    puts "#{beers} #{beers}"
    puts FIGLET.new("cheers!").to_s  

  end


end


class Menu
  extend FindBeer::ClassMethods
  extend ReviewBeer::ClassMethods
  
  def self.progress_bar
    progressbar = ProgressBar.create(format: "\e[0;34m%t: |%B|\e[0m")
    100.times { progressbar.increment; sleep 0.005 }
    
  end
  def self.main_menu(user)
    # prompt = TTY::Prompt.new
    
    choices = {'write a review' => 1, 'find a beer to drink' => 2, 'view my reviews' => 3, 'exit' => 4}
    
    selection = PROMPT.select("Choose your destiny?", choices)
    
    case selection

    when 1
      
      beer_selection = self.select_beer
      if !beer_selection
        main_menu(user)
      end
      user.new_review(beer_selection)
      main_menu(user)
    when 2
      beer_selection = self.find_beer
      main_menu(user)
      
    when 3
      # todo: add my reviews
      reviews = user.reviews
      print_reviews(reviews)
      main_menu(user)
    when 4
      self.exit_program
    end
  end


  def self.exit_program
    hand = Emoji.find_by_alias("wave").raw
    puts "Bye for now! #{hand}"
    exit
  end



  

end
