class GamesController < ApplicationController
	def show
		@game = Game.find(params[:id])
	end
	def create
		@game = Game.new(params["game"].permit(:name, :team1_id, :team2_id, :address, :date))
		if @game.save
			@game.team1.users.each do |player|
				Statistic.create({
					game_id: @game.id, 
					user_id: player.id, 
					goals: 0,
	    			assists: 0,
	    			fouls: 0,
	    			shots: 0,
	    			shots_on_target: 0,
	    			offsides: 0,
	    			yellow_cards: 0,
	    			red_cards: 0
    			});
			end
    			@game.team2.users.each do |player|
				Statistic.create({
					game_id: @game.id, 
					user_id: player.id, 
					goals: 0,
	    			assists: 0,
	    			fouls: 0,
	    			shots: 0,
	    			shots_on_target: 0,
	    			offsides: 0,
	    			yellow_cards: 0,
	    			red_cards: 0
    			});
			end
			redirect_to game_path(@game)
		else
			redirect_to teams_path
		end
	end

	def update
	end

	def xhr

	end
end