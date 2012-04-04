require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  test "session should find user" do
  	user = FactoryGirl.create(:user)
  	assert !user.nil?
  end

end
