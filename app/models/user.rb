class User < ActiveRecord::Base
  has_many :blood_pressures
  has_many :sessions
  

  def read_blood_pressure(blood_pressure)
    bp_number = BloodPressure.create(blood_pressure: blood_pressure)
  end

  def all_food_recs
    FoodRec.find_by(user_id: self.id)
  end

 end
