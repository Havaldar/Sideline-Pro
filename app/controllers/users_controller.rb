class UsersController < ApplicationController
	before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@team = Team.new
		@user.statistics.map do |statistic|
			@user.goals += statistic.goals
			@user.assists += statistic.assists
			@user.fouls += statistic.fouls
			@user.red_cards += statistic.red_cards
			@user.yellow_cards += statistic.yellow_cards
			@user.shots += statistic.shots
			@user.shots_on_target += statistic.shots_on_target
			@user.offsides += statistic.offsides
		end
		@user.save!
		@games = @user.statistics.map do |s| 
			s.game
		end
	end

	def index
		@users = User.all
	end
end