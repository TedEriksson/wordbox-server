# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  oauth_id   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string
#

class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :omniauthable
  include DeviseTokenAuth::Concerns::User

  validates_uniqueness_of :username

	has_many :sentences

	def as_json(options={})
		options.merge!(
			methods: [:sentences, :friends]
		)
		super(options)
	end

	def to_json(options={})
		options.merge!(
			methods: [:sentences, :friends]
		)
		super(options)
	end

	def friend_requests
		@friends = Friend.where("user_two = ?", self).where(pending: true)

		return @friends
	end

	def friends
		@friends = Friend.where("user_one = ? OR user_two = ?", self, self).where(pending: false)

		@users = Array.new

		@friends.each do |friend|
			if friend.user_one == self.id
				@users.push(User.find(friend.user_two).id)
			else
				@users.push(User.find(friend.user_one).id)
			end	
		end

		return @users
	end
end
