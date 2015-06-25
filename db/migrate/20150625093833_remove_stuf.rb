class RemoveStuf < ActiveRecord::Migration
  def change
  	remove_column :users, :goals, :integer
  	remove_column :users, :assists, :integer
  	remove_column :users, :fouls, :integer
  	remove_column :users, :offsides, :integer
  	remove_column :users, :yellow_cards, :integer
  	remove_column :users, :red_cards, :integer
  	remove_column :users, :shots, :integer
  	remove_column :users, :shots_on_target, :integer
  end
end
