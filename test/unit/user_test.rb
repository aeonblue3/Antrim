require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should return true if user has voted" do
  	user = FactoryGirl.create :user
  	assert_true user.has_voted? 1
  end
end
