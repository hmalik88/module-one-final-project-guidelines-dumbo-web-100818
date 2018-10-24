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
  system 'clear'
  sleep 1
 puts "What's your name?"
 #COME BACK TO FIX THIS SO THAT NAME APPEARS AFTER PROMPT
 user = User.create(name: gets.chomp)
 puts "Hey, #{user.name}. Your id number is #{user.id}. Please use it to login from now on"
 main_menu
 user
end

def main_menu
  puts "1. View blood pressure readings"
  puts "2. View foods"
  puts "3. Take blood pressure"
  puts ""
  puts "Please enter a number to perform an action."
  choice = gets.chomp
  if choice == '1'
    #push to bloodpressure readings printout
  elsif choice == '2'
    #push to last recommnded foods
  elsif choice == '3'
    blood_pressure_result(blood_pressure_input)
  end
end

def blood_pressure_readings
  #we're going to return all the blood pressure readings pertaining to the user

end

def recommended_foods
 #we're going to return the last set of recommended foods, which should be a list of 5 foods

end

def blood_pressure_input
 puts "Please enter you're blood pressure in the following format: xx/xx"
 pressure = gets.chomp
 numbers = pressure.split('/')
 numbers.map {|x| x.to_i}
end

def blood_pressure_result(blood_pressure_input)
  x = blood_pressure_input
  if  x[0] > 180 && x[1] > 120
    puts "Your blood pressure is dangerously high, please see a doctor ASAP!"
  elsif (x[0] <= 180 && x[0] >= 130) && (x[1] <= 120 && x[1] >= 85)
    puts ""
    puts "Your BP is lookin' a little high! Maybe cut down on the salty foods."
    puts "Here are some recommendations"
    puts ""
    p give_user_low_sodium_food_recs
  elsif (x[0] <= 129 && x[0] >= 91) && (x[1] <= 84 && x[1] >= 61)
      puts "Your blood pressure range is normal! Keep doin' what you're doin'!"
  elsif (x[0] <= 90 && x[0] >= 60) && (x[1] <= 60 && x[1] >= 33)
    puts "Your BP is lookin' a little low! Maybe incorporate some of these foods in your diet:"
    give_user_high_sodium_food_recs
  elsif x[0] <= 59 && x[1] <= 40
    puts "Your blood pressure is dangerously low, please see a doctor ASAP!"
  end
end

def give_user_low_sodium_food_recs
  food_rec = FoodRec.create(user_id: current_user.user_id, food_rec1: low_sodium_rec[0].name ,food_rec2: low_sodium_rec[1].name, food_rec3: low_sodium_rec[2].name, food_rec4: low_sodium_rec[3].name,food_rec5: low_sodium_rec[4].name)
  food_rec
end


 def give_user_high_sodium_food_recs
  FoodRec.create(user_id: current_user.user_id, food_rec1: high_sodium_rec[0].name ,food_rec2: high_sodium_rec[1].name, food_rec3: high_sodium_rec[2].name, food_rec4: high_sodium_rec[3].name,food_rec5: high_sodium_rec[4].name)
 end

def low_sodium_rec
  food_array = Food.where("sodium_level = ?", "low")
  food_array.shuffle.sample(5)
end

def high_sodium_rec
  food_array = Food.where("sodium_level = ?", "high")
  food_array.shuffle.sample(5)
end
