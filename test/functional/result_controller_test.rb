require 'test_helper'

class ResultControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end
  
  test "should be nil" do
    assert_nil
  end

end
