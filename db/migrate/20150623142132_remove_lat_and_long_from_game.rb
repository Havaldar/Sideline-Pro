class RemoveLatAndLongFromGame < ActiveRecord::Migration
  def change
  	remove_column :games, :lat, :integer
  	remove_column :games, :long, :integer
  	add_column :games, :address, :string
  end
end
