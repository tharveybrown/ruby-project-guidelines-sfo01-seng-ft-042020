### these methods should be within a class.. i.e. Welcome class
class Welcome
    
  def welcome
    # puts out a welcome message here!
    puts "welcome"
    puts "enter your email"
    email = gets.chomp 
    user_email_exists?(email)
  end

  def user_email_exists?(user_email)
    user = User.find_by(email: user_email)
    # if user
    # Person.find_by(name: 'Spartacus', rating: 4)
  end
end

class ReviewBeer
  def get_beer
    puts "What's the name of the beer that would you like to review?"
    beer = gets.chomp
  end

  def create_review(user, beer)
    puts "What did you think of #{beer.name}? Please add a description:"
    description = gets.chomp
    puts "How you rate your drink? Enter anything between 1-10"
    rating = gets.chomp
    user.new_review({description: description, rating: rating, beer: beer})
    
  end
end

# welcome