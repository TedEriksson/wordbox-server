# == Schema Information
#
# Table name: words
#
#  id          :integer          not null, primary key
#  order       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  sentence_id :integer
#  text        :string
#

require 'test_helper'

class WordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
