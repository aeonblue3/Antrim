class Ballot < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:question_text].blank? }, :allow_destroy => true
  validates :name, presence: true
  
  #scope :available_ballots, lambda { where self.start.past?, true}
end
