require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should return true if user has voted" do
  	user = FactoryGirl.create :user
  	assert_true user.has_voted? 1
  end

  test "should update vote status" do
    test_ballot_id = 2
    u = FactoryGirl.create :user
    u.update_voting_status test_ballot_id
    assert_equal u.ballots, test_ballot_id
  end
end
