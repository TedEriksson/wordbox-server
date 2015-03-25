# == Schema Information
#
# Table name: sentences
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Sentence < ActiveRecord::Base
	belongs_to :user
	has_many :words

	def as_json(options={})
  	options.merge!({
  		methods: [:words]
		})
    super(options)
  	end
end
