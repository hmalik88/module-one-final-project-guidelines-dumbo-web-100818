class CreateFoodRecs < ActiveRecord::Migration[5.0]
  def change
    create_table :food_recs do |t|
      t.integer :user_id
      t.integer :food_id
      t.string :food_rec1
      t.string :food_rec2
      t.string :food_rec3
      t.string :food_rec4
      t.string :food_rec5
    end
  end
end
