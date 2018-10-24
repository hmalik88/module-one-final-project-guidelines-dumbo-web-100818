class UpdateBloodPressureColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :blood_pressures, :blood_pressure, :string
    change_column :blood_pressures, :created_at, :datetime
  end
end
