class AddDatetimeToFoodRecs < ActiveRecord::Migration[5.0]
  def change
    add_column :food_recs, :date, :datetime
  end
end
