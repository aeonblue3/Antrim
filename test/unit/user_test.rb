require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should test voter status" do
    current_user = User.find_by_key 123456
    assert_true current_user.has_voted?
  end
  # test "the truth" do
  #   assert true
  # end
end
