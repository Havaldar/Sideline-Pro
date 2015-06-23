class AddStuffToTheStatisticsModel < ActiveRecord::Migration
  def change
  	remove_column :statistics, :type, :string
  	add_column :statistics, :goals, :integer
  	add_column :statistics, :assists, :integer
  	add_column :statistics, :fouls, :integer
  	add_column :statistics, :shots, :integer
  	add_column :statistics, :shots_on_target, :integer
  	add_column :statistics, :offsides, :integer
  	add_column :statistics, :yellow_cards, :integer
  	add_column :statistics, :red_cards, :integer
  end
end
