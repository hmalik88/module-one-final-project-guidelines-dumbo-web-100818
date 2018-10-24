class Food < ActiveRecord::Base
  has_many :foodrecs
  has_many :blood_pressures, through: :foodrecs

end
