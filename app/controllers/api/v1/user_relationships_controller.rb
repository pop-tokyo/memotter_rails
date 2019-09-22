class Api::V1::UserRelationshipsController < Api::V1::ApplicationController
	before_action :set_other_user, only: [:create, :destroy, :show]

	def show
		render json: { following: current_user.follow?(@other_user), followed: current_user.followed?(@other_user) }
	end

	def create
		new_relationship = current_user.follow(@other_user)
		render json: new_relationship
	end

	def destroy
		current_user.unfollow @other_user
		render json: { status: 'success'}
	end

	private

	def set_other_user
		@other_user = User.find_by!(username: params[:other_username])
	end
end
