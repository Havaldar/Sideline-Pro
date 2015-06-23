class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@team = Team.new
		@user_teams = @user.teams
	end

	def index
		@users = User.all
	end

end