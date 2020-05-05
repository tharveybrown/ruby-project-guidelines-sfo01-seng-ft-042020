### these methods should be within a class.. i.e. Welcome class

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

# welcome