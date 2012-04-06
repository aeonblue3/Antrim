class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :ballot

  attr_accessible :user_id, :ballot_id, :vote_date
end
