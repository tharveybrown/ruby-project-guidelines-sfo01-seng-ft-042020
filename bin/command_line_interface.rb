class Welcome 

  def get_email
    # puts out a welcome message here!
    puts "welcome"
    puts "enter your email"
    email = gets.chomp 
  end
  
  def find_or_create_user(user_email)
    user = User.find_by(email: user_email)
    if !user 
      sign_up(user_email)
    else  
      user
    end
    # Person.find_by(name: 'Spartacus', rating: 4)
  end

  def sign_up(user_email)
    puts "Cheers! Whats your name?"
    name = gets.chomp
    User.create({ name: name, email: user_email})
  end
end

class ReviewBeer
  def select_beer
    puts "What's the name of the beer that would you like to review?"
    beer_name = gets.chomp
  end

  #prompt to give user the option to list all by name or abv
  #give the option for ASC or DESC
  def create_review(user, beer)
    puts "What did you think of #{beer.name}? Please add a description:"
    description = gets.chomp
    puts "How would you rate your drink? Enter anything between 1-10"
    rating = gets.chomp
    user.new_review({description: description, rating: rating, beer: beer})
  end
end



class Menu
  
  def choose_what_to_do
    prompt = TTY::Prompt.new
    
    choices = {'write a review' => 1, 'find a beer to drink' => 2, 'exit' => 3}
    
    prompt.select("Choose your destiny?", choices)
  end
end
# welcome