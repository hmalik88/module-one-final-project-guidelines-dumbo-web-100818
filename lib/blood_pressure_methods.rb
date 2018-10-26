
def blood_pressure_input
# This method takes an input of a blood pressure (without controlling for invalid user input), and creates an instance of a blood pressure reading for the current user.
   puts "Please enter you're blood pressure in the following format: xxx/xxx"
   pressure = gets.chomp
   BloodPressure.create(user_id: current_user.user_id, blood_pressure: pressure, created_at: Time.now)
   numbers = pressure.split('/')
   numbers.map {|x| x.to_i}
end

def blood_pressure_result(blood_pressure_input)
  x = blood_pressure_input
  if  x[0] > 180 && x[1] > 120
    puts "Your blood pressure is dangerously high, please see a doctor ASAP!"
    navigation
  elsif (x[0] <= 180 && x[0] >= 130) && (x[1] <= 120 && x[1] >= 85)
    space
    puts "Your BP is lookin' a little high! Maybe cut down on the salty foods."
    puts "Here are some recommendations"
    space
    puts give_user_low_sodium_food_recs
    space
    navigation
  elsif (x[0] <= 129 && x[0] >= 91) && (x[1] <= 84 && x[1] >= 61)
    puts "Your blood pressure range is normal! Keep doin' what you're doin'!"
    puts "And maybe TREAT YO'SELF"
    navigation
  elsif (x[0] <= 90 && x[0] >= 60) && (x[1] <= 60 && x[1] >= 33)
    puts "Your BP is lookin' a little low! Maybe incorporate some of these foods in your diet:"
    give_user_high_sodium_food_recs
    space
    navigation
  elsif x[0] <= 59 && x[1] <= 40
    puts "Your blood pressure is dangerously low, please see a doctor ASAP!"
    navigation
  end
end

def blood_pressure_readings
  #we're going to return all the blood pressure readings pertaining to the user
  readings = BloodPressure.where(user_id: current_user.user_id)
  if readings == []
    puts "You don't have any readings!"
  else
    readings.each_with_index do |reading, i|
      puts "#{i+1}. #{reading.blood_pressure}"
      line_break
    end
  end
  space
  navigation
end
