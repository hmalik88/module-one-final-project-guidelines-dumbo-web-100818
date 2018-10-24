class User < ActiveRecord::Base
  has_many :blood_pressures
  def read_blood_pressure(blood_pressure)
    bp_number = BloodPressure.create(blood_pressure: blood_pressure)
  end
 end
