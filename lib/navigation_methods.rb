def welcome_screen
  fork{ exec 'afplay', 'music/heart_beat.mpa'}
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
  sleep 1
  clear
  menu_line_break
  menu_vertical_break
  menu_line_break
  space
  longer_line_break
  space
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
  end
  if Time.now.to_s[0..9] == food_rec_exists?.last.date.to_s[0..9]
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
  # prompt.on(:keypress) do |event|
  #   if event.value == 'b'
  #     food_rec_selection
  #   elsif event.value == 'm'
  #     main_menu
  #   end
  # end
  #   clear
  #   main_menu
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
