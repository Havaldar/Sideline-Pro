class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@team = Team.new
		@profile_name = User.name.upcase
	end

	def index
		@users = User.all
	end

end