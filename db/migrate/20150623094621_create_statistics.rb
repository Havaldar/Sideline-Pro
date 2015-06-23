class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.string :type
      t.integer :count
      t.integer :user_id
      t.integer :game_id

      t.timestamps null: false
    end
  end
end
