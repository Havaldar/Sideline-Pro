class TeamsController < ApplicationController
	def show
		@team = Team.find(params[:id])
		@game = Game.new
		@teams = current_user.teams.map do |team|
			[team.name, team.id]
		end
	end

	def index
		@teams = Team.filter(params[:q])
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

	def edit 
		@team = Team.find(params[:id])
		@team.avatar = params[:avatar]
		@team.name = params[:name]
		
		if @team.save
			redirect_to team_path(@team)
		else
			render :index
		end
	end

	def update
	end

	def team_params
  		params.require(:team).permit(:avatar)
	end
end