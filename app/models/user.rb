class User < ActiveRecord::Base
  validates_uniqueness_of :key
  
  attr_accessible :key, :ballots
  def has_voted?
    if ballots.nil?
      return false
    end
    if ballots.split(':').include?(:id)
      return true
    end
    return false
  end
end
