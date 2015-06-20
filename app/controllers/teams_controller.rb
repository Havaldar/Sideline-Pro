class TeamsController < ApplicationController
	def show
		@team = Team.find(params[:id])
	end

	def index
		@teams = Team.all
	end

	def new 
	end

	def create
	end
end