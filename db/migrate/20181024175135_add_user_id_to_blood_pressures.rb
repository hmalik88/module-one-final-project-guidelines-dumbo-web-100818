class AddUserIdToBloodPressures < ActiveRecord::Migration[5.0]
  def change
    add_column :blood_pressures, :user_id, :integer
  end
end
