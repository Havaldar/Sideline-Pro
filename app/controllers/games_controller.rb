class GamesController < ApplicationController
	def show
	end

	def create
		@game = Game.new(params["game"].permit(:name))
		if @game.save
			redirect_to '/games/:id'
		else
			render :index
		end
	end

	def update
	end
end