class User < ActiveRecord::Base
  validates_uniqueness_of :key
  
  attr_accessible :key, :ballots
  def hssas_voted? id
    if self.ballots.nil?
      return false
    elsif id.in? self.ballots.split(':')
      return true
    else
      return false
    end
  end

  def update_voting_status ballot_id
    if self.ballots.nil? or self.ballots.empty?
      self.ballots = ballot_id
    else
      self.ballots += ":#{ballot_id}"
    end
    self.save
  end
end
