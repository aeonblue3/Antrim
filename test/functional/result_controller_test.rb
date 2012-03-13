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
  
  test "should retrun integer"
    get "result/1"
    assert_equal_to 1
  end

end
