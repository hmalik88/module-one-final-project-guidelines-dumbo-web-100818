class RemoveUpdatedAtColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :blood_pressures, :updated_at, :datetime
  end
end
