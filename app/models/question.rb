class Question < ActiveRecord::Base
  belongs_to :ballot
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:answer_text].blank? }, :allow_destroy => true
  
  attr_accessible :question_text, :ballot_id, :answers_attributes
end
