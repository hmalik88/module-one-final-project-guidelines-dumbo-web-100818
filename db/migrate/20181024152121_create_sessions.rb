class CreateSessions < ActiveRecord::Migration[5.0]
  def change
    create_table :sessions do |t|
      t.integer :user_id
      t.string :user_name
      t.datetime :session_time
    end
  end
end
