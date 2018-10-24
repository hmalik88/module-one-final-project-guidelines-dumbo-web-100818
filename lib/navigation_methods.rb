

def main_menu
  clear
  puts "1. View blood pressure readings"
  puts "2. View foods"
  puts "3. Take blood pressure"
  puts "4. Exit Program"
  space
  puts "Please enter a number to perform an action."
  choice = gets.chomp
  if choice == '1'
    #push to bloodpressure readings printout
  elsif choice == '2'
    #push to last recommnded foods
  elsif choice == '3'
    blood_pressure_result(blood_pressure_input)
  elsif choice == '4'
    exit
  end
end

def navigation
    puts "Press enter to go to main menu"
    choice = gets.chomp
    clear
    main_menu
end
