def welcome_screen
  fork{ exec 'afplay', 'music/heart_beat.m4a'}
  puts (<<-HEREDOC)

88888888888 888               888    d8b                            888          888
    888     888               888    88P                            888          888
    888     888               888    8P                             888          888
    888     88888b.   8888b.  888888 "  .d8888b        8888b.       888  .d88b.  888888
    888     888 "88b     "88b 888       88K               "88b      888 d88""88b 888
    888     888  888 .d888888 888       "Y8888b.      .d888888      888 888  888 888
    888     888  888 888  888 Y88b.          X88      888  888      888 Y88..88P Y88b.
    888     888  888 "Y888888  "Y888     88888P'      "Y888888      888  "Y88P"   "Y888
                .d888                                                                               888
               d88P"                                                                                888
               888                                                                                  888
       .d88b.  888888      88888b.  888d888 .d88b.  .d8888b  .d8888b  888  888 888d888 .d88b.       888
      d88""88b 888         888 "88b 888P"  d8P  Y8b 88K      88K      888  888 888P"  d8P  Y8b      888
      888  888 888         888  888 888    88888888 "Y8888b. "Y8888b. 888  888 888    88888888      Y8P
      Y88..88P 888         888 d88P 888    Y8b.          X88      X88 Y88b 888 888    Y8b.           "
       "Y88P"  888         88888P"  888     "Y8888   88888P'  88888P'  "Y88888 888     "Y8888       888
                           888
                           888
                           888

  HEREDOC
  puts "            An app for food recommendations based on your blood pressure! Press enter to continue".upcase
  x = gets.chomp
  fork{ exec 'killall afplay'}
  clear
end


def main_menu
  sleep 0.5
  clear
  menu_box
  menu_choices = ["View blood pressure readings", "View foods", "Take blood pressure", "Exit Program"]
  x = prompt.select("", menu_choices)
    if x == menu_choices[0]
      #push to bloodpressure readings printout
      clear
      blood_pressure_readings
    elsif x == menu_choices[1]
      #push to last recommnded foods
      clear
      recommended_foods
    elsif x == menu_choices[2]
      clear
      validate
    elsif x == menu_choices[3]
      clear
      exit
    end
end

def validate
  if food_rec_exists? == []
    blood_pressure_result(blood_pressure_input)
  elsif food_rec_exists? != []
    blood_pressure_result(blood_pressure_input)
  elsif(Time.now.to_s[0..9] == food_rec_exists?.last.date.to_s[0..9])
    puts "You've already logged your BP for today, you don't need another reading...too soon! Check tomorrow."
    space
    navigation
  else
  blood_pressure_result(blood_pressure_input)
  end
end

def navigation
    puts "Press enter to go to main menu"
    choice = gets.chomp
    clear
    main_menu
end

def custom_navigation
  puts "Please enter 'b' to go back OR enter 'm' for main menu"
  choice = gets.chomp.downcase
    if choice == "b"
      clear
      selected_food_rec
    elsif choice == "m"
      main_menu
    elsif choice != "b" || choice != "m"
      puts "That's not a valid input...you trying to break me? Try again."
      clear
      custom_navigation
    end
end

def bp_navigation
 menu_choices = ["Delete last BP", "Delete all BP's", "Return to main menu"]
 readings = BloodPressure.where(user_id: current_user.user_id)
 list_of_id = []
   readings.each do |reading|
     list_of_id << reading.id
   end
   food_recs = FoodRec.where(user_id: current_user.user_id)
   list_of_food_rec_id = []
   food_recs.each do |food_rec|
     list_of_food_rec_id << food_rec.id
   end

 x = prompt.select("", menu_choices)
   if x == menu_choices[0]
     if readings.empty?
       puts "You don't have any readings to delete!"
       space
       navigation
     else
       readings.each do |reading|
         BloodPressure.destroy(reading.id).save
       end
       if food_recs != []
         food_recs.each do |food_rec|
           FoodRec.destroy(food_rec.id).save
         end
       end
       space
       clear
       navigation
     end
   elsif x == menu_choices[1]
     if readings.empty?
       puts "You don't have any readings to delete!"
       navigation
     else
       prompt.select("This will also delete all of your food recommendations, are you sure you want to continue?", %w(Yes no))
       if prompt == "Yes"
         readings.each do |reading|
           BloodPressure.destroy(reading.id)
         end
          all_blood_pressures = BloodPressure.all
          all_blood_pressures.each do |bp|
            bp.reload
          end
         food_recs.each do |food_rec|
           FoodRec.destroy(food_rec.id)
         end
         clear
         navigation
       else
         bp_navigation
       end
     end
   elsif x == menu_choices[2]
     main_menu
   end
end
