class GamesController < ApplicationController
	def show
		@game = Game.find(params[:id])
	end

	def create
		@game = Game.new(params["game"].permit(:name, :team1_id, :team2_id, :address, :date))
		if @game.save
			redirect_to game_path(@game)
		else
			redirect_to teams_path
		end
	end

	def update
	end
end