class MembershipsController < ApplicationController
	def create
		Membership.create(:user_id => current_user.id, :team_id => params[:team_id])
		redirect_to :back
	end
end