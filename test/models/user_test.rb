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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
