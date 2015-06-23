class TeamsController < ApplicationController
	def show
		@team = Team.find(params[:id])
		@game = Game.new
		@teams = current_user.teams.map do |team|
			[team.name, team.id]
		end
	end

	def index
		@teams = Team.all
		@team = Team.new
	end

	def new 
	end

	def create
		@team = Team.new(params["team"].permit(:name))
		if @team.save
			redirect_to team_path(@team.id)
			Membership.create(team_id: @team.id, user_id: current_user.id)
		else
			render :index
		end
	end
end