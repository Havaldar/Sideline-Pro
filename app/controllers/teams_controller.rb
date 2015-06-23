class TeamsController < ApplicationController
	def show
		@team = Team.find(params[:id])
		@game = Game.new
	end

	def index
		@teams = Team.all
		@team = Team.new
	end

	def new 
	end

	def create
		@team = Team.new(params["team"].permit(:name, :avatar))
		if @team.save
			redirect_to team_path(@team.id)
			Membership.create(team_id: @team.id, user_id: current_user.id)
		else
			render :index
		end
	end

	def team_params
  		params.require(:team).permit(:avatar)
	end
end