class User < ActiveRecord::Base
  validates_uniqueness_of :key
  
  attr_accessible :key, :ballots
end
