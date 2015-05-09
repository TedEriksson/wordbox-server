class FriendsController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :authenticate_user!
	def update
		@friend = Friend.find params[:id]

		if not current_user.id == @friend.user_two
			render json: {}, status: 404
			return
		end

		if @friend.update update_params
			render json: {}, status: 200
		else
			render json: {}, status: 400
		end
	end

	private
		def update_params
			params.permit(:id, :pending)
		end
end