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

	def add_friend
		@friend = Friend.new

		@friend.user_one = params[:user_id]
		@friend.user_two = params[:id]

		if @friend.save!
			render json: {}, status: 200
		else
			render json: {}, status: 400
		end
	end

	private
		def user_params
			params.permit(:oauth_id)
		end
end
