class RemoveFoodIdColumnFromFoodrecs < ActiveRecord::Migration[5.0]
  def change
    remove_column :food_recs, :food_id, :integer
  end
end
