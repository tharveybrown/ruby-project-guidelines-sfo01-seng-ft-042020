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
      user = sign_up(user_email)
      welcome_user_message(user)
      user
    else  
      welcome_user_message(user)
      user
    end

    
    # Person.find_by(name: 'Spartacus', rating: 4)
  end

  def welcome_user_message(user)
    name = user.name.split(' ')[0]
    binding.pry
    puts FIGLET.new("Welcome,\n#{name}", 'block')
    puts "\n"
  end

  def sign_up(user_email)
    puts "Cheers! Whats your name?"
    name = gets.chomp
    user = User.create({ name: name, email: user_email})
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
    # binding.pry
    # prompt = TTY::Prompt.new
    
    choices = {'write a review' => 1, 'find a beer to drink' => 2, 'view reviews' => 3, 'highest rated beers' => 4, 'sort beers' => 5, 'exit' => 6}
    
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
      review_menu(user)
      main_menu(user)
    when 4
      Beer.highest_rated
      main_menu(user)
    when 5
      Beer.sort_beers_option
      main_menu(user)
    when 6
      self.exit_program
    end
  end

  def self.review_menu(user)
    choices = {'top reviews' => 1, 'my reviews' => 2}
    
    selection = PROMPT.select("which reviews would you like to see?\n", choices)
    case selection
    when 1
      top_five = Review.top_reviews(5)
      Review.print_reviews(top_five)
    when 2
      # binding.pry
      reviews = user.reviews
      if reviews.empty?
        puts "Looks like you haven't written any reviews yet!\n".colorize(:red)
        return 
      end
      Review.print_reviews(reviews)
      
    end
  end

  def self.exit_program
    hand = Emoji.find_by_alias("wave").raw
    puts "Bye for now! #{hand}"
    exit
  end



  

end
