class Api::V1::UsersController < Api::V1::ApplicationController
	def show
		@user = User.find_by(username: params[:username])
		render json: @user
	end
end
