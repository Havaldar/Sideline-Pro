class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@team = Team.new
		@goals = 0
		@assists = 0
		@fouls = 0
		@red_cards = 0
		@yellow_cards = 0
		@shots = 0
		@shots_on_target = 0
		@offsides = 0

		@user.statistics.each do |statistic|
			@goals += statistic.goals
			@assists += statistic.assists
			@fouls += statistic.fouls
			@red_cards += statistic.red_cards
			@yellow_cards += statistic.yellow_cards
			@shots += statistic.shots
			@shots_on_target += statistic.shots_on_target
			@offsides += statistic.offsides
		end
		
		@games = @user.statistics.map do |s| 
			s.game
		end
	end

	def index
		@users = User.all
	end
end