def low_sodium_rec
  food_array = Food.where("sodium_level = ?", "low")
  food_array.sample(5)
end

def high_sodium_rec
  food_array = Food.where("sodium_level = ?", "high")
  food_array.sample(5).uniq
end


def food_array
  puts FoodRec.last.food_rec1
  puts FoodRec.last.food_rec2
  puts FoodRec.last.food_rec3
  puts FoodRec.last.food_rec4
  puts FoodRec.last.food_rec5
  puts ""
  navigation
end

def give_user_low_sodium_food_recs
  FoodRec.create(user_id: current_user.user_id, food_rec1: low_sodium_rec[0].name ,food_rec2: low_sodium_rec[1].name, food_rec3: low_sodium_rec[2].name, food_rec4: low_sodium_rec[3].name,food_rec5: low_sodium_rec[4].name)

  food_array
end

def give_user_high_sodium_food_recs
 FoodRec.create(user_id: current_user.user_id, food_rec1: high_sodium_rec[0].name ,food_rec2: high_sodium_rec[1].name, food_rec3: high_sodium_rec[2].name, food_rec4: high_sodium_rec[3].name,food_rec5: high_sodium_rec[4].name)

 food_array
end

def recommended_foods
 #we're going to return the last set of recommended foods, which should be a list of 5 foods

end
