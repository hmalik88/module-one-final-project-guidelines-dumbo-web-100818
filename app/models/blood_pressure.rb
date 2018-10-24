class BloodPressure < ActiveRecord::Base
  has_many :foodrecs
  has_many :foods, through: :foodrecs
end
