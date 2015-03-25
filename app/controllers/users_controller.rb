class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	def create
		@user = User.create user_params

		if @user.save!
			render json: @user
		else
			render json: {}, status: 400
		end
	end

	def show
		@user = User.find params[:id]

		render json: @user
	end

	private
		def user_params
			params.permit(:oauth_id)
		end
end
