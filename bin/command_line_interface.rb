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


class Menu

  def self.main_menu(user)
    # prompt = TTY::Prompt.new
    
    choices = {'write a review' => 1, 'find a beer to drink' => 2, 'view_my_reviews' => 3, 'exit' => 4}
    
    selection = PROMPT.select("Choose your destiny?", choices)
    
    case selection
    when 1
      user.review_beer
    when 2
      user.find_beer
    when 3
      # todo: add my reviews
      user.my_reviews
    when 4
      user.exit_program
    end
  end
end
