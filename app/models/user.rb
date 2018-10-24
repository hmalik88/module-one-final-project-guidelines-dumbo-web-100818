class User < ActiveRecord::Base
  has_many :blood_pressures
  has_many :sessions 

  def read_blood_pressure(blood_pressure)
    bp_number = BloodPressure.create(blood_pressure: blood_pressure)
  end

  # def create_food_rec(self.id)
  #
  # end

 end
