require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "status should be false" do
    user = User(:one)
    user.has_voted? Ballot(:one).id
  end
  # test "the truth" do
  #   assert true
  # end
end
