class StatisticsController < ApplicationController
	def update
		t = Statistic.where({user_id: params[:player_id], game_id: params[:game_id]}).first
		response = ""
		case params[:stat_options]
		when "1"
			t.goals += 1
			response = "#{User.find(user_id: params[:player_id]).name} scored a goal!"
		when "2"
			t.assists += 1
			response = "#{User.find(user_id: params[:player_id]).name} made an assist."
		when "3"
			t.fouls += 1
			response = "#{User.find(user_id: params[:player_id]).name} fouled a player."
		when "4"
			t.yellow_cards += 1
			response = "#{User.find(user_id: params[:player_id]).name} recieved a yellow card."
		when "5"
			t.red_cards += 1
			response = "#{User.find(user_id: params[:player_id]).name} recieved a red card."
		when "6"
			t.shots += 1
			response = "#{User.find(user_id: params[:player_id]).name}  just shot."
		when "7"
			t.shots_on_target += 1
			response = "#{User.find(user_id: params[:player_id]).name} just shot at goal."
		when "8" 
			t.offsides += 1
			response = "#{User.find(user_id: params[:player_id]).name} was caught offside."
		else
		end

		t.save!

		render nothing: true
	end
end