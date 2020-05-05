### these methods should be within a class.. i.e. Welcome class
require_relative  '../app/models/user'
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
    puts "Please select a beer"
    beer_name = gets.chomp
  end

  #prompt to give user the option to list all by name or abv
  #give the option for ASC or DESC
  def 
  end
end


# welcome