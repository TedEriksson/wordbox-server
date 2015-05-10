class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token
	
	before_action :authenticate_user!
	def create
		@user = User.create user_params

		if @user.save!
			render json: @user
		else
			render json: {}, status: 400
		end
	end

	def show
		if params[:id] == "me" 
			render json: current_user
			return			
		end

		@user = User.find params[:id]

		render json: @user
	end

	def add_friend
		@friend = Friend.new

		friend_to_add = User.find_by username: params[:username]

		if not friend_to_add
			render json: {}, status: 404
			return
		end

		@friend.user_one = params[:user_id]
		@friend.user_two = friend_to_add.id

		if @friend.save!
			render json: {}, status: 200
		else
			render json: {}, status: 400
		end
	end

	def friend_requests
		# if not current_user == params[:user_id]
		# 	render json: {}, status: 404
		# 	return
		# end
		@user = User.find params[:user_id]

		render json: @user.friend_requests, status: 200
	end

	private
		def user_params
			params.permit(:username)
		end
end
