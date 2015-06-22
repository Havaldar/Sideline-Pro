class MembershipsController < ApplicationController
	def create
		Membership.new(:user_id => current_user.id, :team_id => params[:team_id]).save
		redirect_to :back
	end
end