class Game < ActiveRecord::Base
	belongs_to :team1, class_name: 'Team'
  	belongs_to :team2, class_name: 'Team'
  	has_many :statistics

  	validates :name, presence: true, uniqueness: true
end
