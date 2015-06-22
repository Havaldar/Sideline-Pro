class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.datetime :date
      t.integer :team1_id
      t.integer :team2_id
      t.float :lat
      t.float :lon
      t.string :status

      t.timestamps null: false
    end
  end
end
