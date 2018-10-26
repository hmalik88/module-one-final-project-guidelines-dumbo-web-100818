def low_sodium
  Food.where("sodium_level = ?", "low").shuffle
end

def high_sodium_rec
  Food.where("sodium_level = ?", "high")
end


def low_sodium_rec
    arr = low_sodium.map(&:name).sample(5).uniq
end

def food_array


end

def give_user_low_sodium_food_recs
  arr = low_sodium_rec
  rec = FoodRec.create(user_id: current_user.user_id, date: Time.now, food_rec1: arr[0],food_rec2: arr[1], food_rec3: arr[2], food_rec4: arr[3],food_rec5: arr[4])
  arr
end

def give_user_high_sodium_food_recs
 FoodRec.create(user_id: current_user.user_id, date: Time.now, food_rec1: high_sodium_rec[0].name ,food_rec2: high_sodium_rec[1].name, food_rec3: high_sodium_rec[2].name, food_rec4: high_sodium_rec[3].name,food_rec5: high_sodium_rec[4].name)

 food_array
end


def recommended_foods
  choices = ["View last recommended foods", "View recommended foods by date"]
  x = prompt.select(" ", choices)
  # binding.pry
  if food_rec_exists? != [] && x == choices[0]
    if food_rec_exists?.length > 1
     last_recommended = [food_rec_exists?.last]
    elsif food_rec_exists?.length == 1
     last_recommended = food_rec_exists?
    end
     line_break
     puts "1.  #{last_recommended[0].food_rec1}"
     line_break
     puts "2.  #{last_recommended[0].food_rec2}"
     line_break
     puts "3.  #{last_recommended[0].food_rec3}"
     line_break
     puts "4.  #{last_recommended[0].food_rec4}"
     line_break
     puts "5.  #{last_recommended[0].food_rec5}"
     space
     puts "Here's your list of foods based on your last blood pressure reading."
     space
     navigation
  elsif food_rec_exists? != [] && x == choices[1]
    selected_food_rec
    space
    custom_navigation
  else
    puts "You don't have any food recommendations! Press enter to log a blood pressure reading on the main menu."
    enter = gets.chomp
    main_menu
  end
end

def food_rec_exists?
  FoodRec.where(user_id: current_user.user_id)
end

def food_recs_by_date
  arr = []
  food_rec_exists?.each do |food_rec|
    arr << ["#{food_rec.date.to_s[0..9]}"]
  end
  arr
end

def food_rec_selection
    prompt.select("Previous Recommendations", [food_recs_by_date, "Main Menu"])
    #binding.pry
end

def selected_food_rec
  checker = food_rec_selection
  if checker == "Main Menu"
    main_menu
  else
    selection = food_rec_exists?.find do |food_rec|
      food_rec.date.to_s[0..9] == checker
    end
    selection
    line_break
    puts "1. #{selection.food_rec1}"
    puts "2. #{selection.food_rec2}"
    puts "3. #{selection.food_rec3}"
    puts "4. #{selection.food_rec4}"
    puts "5. #{selection.food_rec5}"
    line_break
    custom_navigation
  end
end
