def welcome_message
 puts "Welcome!"
end


def ask_if_returning_user
  prompt.select("Are you a returning user?", %w(Yes No))
end

def returning_user?
   if ask_if_returning_user == "Yes"
     is_a_returning_user
   else
     create_account
   end
end

def wrong_info
  clear
  choice =["Exit", "Create Account", "Return to Login"]
   x = prompt.select("Whoops! That user doesn’t exist. Create your account or try again.", choice)
   if x == choice[0]
    exit
  elsif x == choice[1]
    create_account
  elsif x == choice[2]
    system 'clear'
    is_a_returning_user
  end
end

def is_a_returning_user
 clear
 line_break
 login_vertical_break
 line_break
 space
 puts "Enter Name"
 username = gets.chomp.capitalize
 puts "Enter User ID"
 user_id = gets.chomp
 user = User.find_by(id:user_id.to_i, name: username)
 Session.create(user_id: user_id, user_name: username, session_time: Time.now)
   if !user
    wrong_info
   else
     puts "Welcome back, #{user.name}!"
   end
 main_menu
end

def current_user
  Session.all.last
end

def create_account
   clear
   line_break
   create_account_vertical_break
   line_break
   space
   puts "What's your name?"
   user = User.create(name: gets.chomp.capitalize)
   puts "Hey, #{user.name}! Your id number is #{user.id}. Please use it to login from now on."
    Session.create(user_id: user.id, user_name: user.name, session_time: Time.now)

   sleep 2.0
   main_menu
   user
end
