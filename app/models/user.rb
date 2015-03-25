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
			methods: [:sentences]
		)
		super(options)
	end
end
