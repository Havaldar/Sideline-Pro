class StatisticsController < ApplicationController
	def update
			binding.pry
			stat = Statistic.where({user_id: , game_id: }).first;
			case ..
			when 1
				stat.goal += 1
			when 2
				stat.assist += 1
			when 3
				stat.foul += 1
			when 4
				stat.yellow_card += 1
			when 5
				stat.red_card += 1
			when 6
				stat.shot += 1
			when 7
				stat.shot_on_goal += 1
			else
				stat.offside += 1
			end
			stat.save
	end
end