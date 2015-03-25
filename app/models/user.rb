# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  oauth_id   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
	has_many :sentences

	def to_json(options={})
		options.merge!(
			methods: [:sentences, :friends]
		)
		super(options)
	end

	def friends
		@friends = Friend.where("user_one = ? OR user_two = ?", self, self)

		@users = Array.new

		@friends.each do |friend|
			if friend.user_one == self.id
				@users.push(User.find(friend.user_two))
			else
				@users.push(User.find(friend.user_one))
			end	
		end

		return @users
	end
end
