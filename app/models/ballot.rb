class Ballot < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:question_text].blank? }, :allow_destroy => true
  validates_presence_of :name, :description, :start, :end
  #scope :available_ballots, lambda { where self.start.past?, true}
  attr_accessible :name, :description, :start, :end
end
