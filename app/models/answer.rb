class Answer < ActiveRecord::Base
  belongs_to :questions
  
  attr_accessible :answer_text, :question_id
end
