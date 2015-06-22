class TeamsController < ApplicationController
	def show
		@team = Team.find(params[:id])
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
			redirect_to team_path(Team.last.id)
		else
			render :index
		end
	end
	def join_team
		user = current_user.id
		team = params[:id]

		membership = Membership.new(user_id: user, team_id: team)
		membership.save



	end
end