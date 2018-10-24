def welcome_message
 puts "Welcome!"
end


def ask_if_returning_user
  puts  "Are you a returning user? Y/N"
  user_response = gets.chomp
end

def returning_user?
   if ask_if_returning_user == 'Y'
    is_a_returning_user
   elsif ask_if_returning_user == 'N'
     create_account
   else
   puts "Not a valid input. Please enter Y/N"
  end
end

def wrong_info
 puts "Whoops! That user doesn’t exist. Create your account or try again."
 puts ""
 puts "0. Exit"
 puts "1. Create Account"
 puts "2. Return to Login"
 puts ""
 puts "Please enter a number to perform an action."
 choice = gets.chomp
   if choice == '0'
    exit
  elsif choice == '1'
    create_account
  elsif choice == '2'
    system 'clear'
    is_a_returning_user
  end
end

def is_a_returning_user
 puts "Enter Name"
 username = gets.chomp
 puts "Enter User ID"
 user_id = gets.chomp
 user = User.find_by(id:user_id.to_i, name: username)
 Session.create(user_id: user_id, user_name: username, session_time: Time.now)
   if !user
    wrong_info
   else
     puts "Hey #{user.name}!"
   end
 main_menu
end

def current_user
  Session.all.last
end

def create_account
   clear
   sleep 1
   puts "What's your name?"
   user = User.create(name: gets.chomp)
   puts "Hey, #{user.name}. Your id number is #{user.id}. Please use it to login from now on"
   main_menu
   user
end
