class FoodRec < ActiveRecord::Base
  belongs_to :food
  belongs_to :blood_pressure

  
end
