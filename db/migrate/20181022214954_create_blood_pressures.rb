class CreateBloodPressures < ActiveRecord::Migration[5.0]
  def change
    create_table :blood_pressures do |t|
      t.float :blood_pressure
      t.timestamps
    end
  end
end
