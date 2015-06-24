class AddStuff < ActiveRecord::Migration
  def change
  	add_column :users, :goals, :integer
  	add_column :users, :assists, :integer
  	add_column :users, :fouls, :integer
  	add_column :users, :offsides, :integer
  	add_column :users, :yellow_cards, :integer
  	add_column :users, :red_cards, :integer
  	add_column :users, :shots, :integer
  	add_column :users, :shots_on_target, :integer
    remove_column :statistics, :count, :integer
  end
end
