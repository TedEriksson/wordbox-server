# == Schema Information
#
# Table name: friends
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_one   :integer
#  user_two   :integer
#

class Friend < ActiveRecord::Base
end
