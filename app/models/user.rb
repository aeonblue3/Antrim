class User < ActiveRecord::Base
  has_many :votes
  has_many :ballots, through: :votes
  validates_uniqueness_of :key
  
  attr_accessible :key, :ballots, :id, :created_at, :updated_at
  def has_voted? id
    if id.in? self.ballots.split(':')
      return true
    else
      return false
    end
  end

  def update_voting_status ballot_id
    self.ballots.push(Ballot.find_by_id(ballot_id))
    self.save
  end
end
