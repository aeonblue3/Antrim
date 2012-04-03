class Ballot < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:question_text].blank? }, :allow_destroy => true
  validates_presence_of :name, :description, :start, :end

  attr_accessible :name, :description, :start, :end, :questions_attributes, :id, :created_at, :updated_at

  scope :available_ballots, where("start < :today AND end > :today", {:today => Time.now})
  scope :expired_ballots, where("end < :today", {:today => Time.now})
end
