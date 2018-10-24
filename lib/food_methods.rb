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
  rec = FoodRec.create(user_id: current_user.user_id, food_rec1: arr[0],food_rec2: arr[1], food_rec3: arr[2], food_rec4: arr[3],food_rec5: arr[4])
  arr
end

def give_user_high_sodium_food_recs
 FoodRec.create(user_id: current_user.user_id, food_rec1: high_sodium_rec[0].name ,food_rec2: high_sodium_rec[1].name, food_rec3: high_sodium_rec[2].name, food_rec4: high_sodium_rec[3].name,food_rec5: high_sodium_rec[4].name)

 food_array
end

def recommended_foods
 #we're going to return the last set of recommended foods, which should be a list of 5 foods

end
