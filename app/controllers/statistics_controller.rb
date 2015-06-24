class StatisticsController < ApplicationController
	def update
		stat = Statistic.where({user_id: params[:player_id], game_id: params[:game_id]}).first
		case params[:stat_option]
		when 1
			stat.goals += 1
		when 2
			stat.assists += 1
		when 3
			stat.fouls += 1
		when 4
			stat.yellow_cards += 1
		when 5
			stat.red_cards += 1
		when 6
			stat.shots += 1
		when 7
			stat.shots_on_target += 1
		when 8 
			stat.offsides += 1
		else
		end
		stat.save

		render :show
	end
end