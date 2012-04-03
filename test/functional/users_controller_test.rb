require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "create should create new user" do
    assert_difference 'User.count' do
      User.create key: 123456
    end
  end
  # test "the truth" do
  #   assert true
  # end
end
