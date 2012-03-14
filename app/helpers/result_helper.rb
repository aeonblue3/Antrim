module ResultHelper
  def normalize_answer_count answer_count, question_id
    t_count = answer_count question_id
    (answer_count.to_f / t_count.to_f)*100
  end
  def answer_count question_id
    answer_counts = Answer.select(:count).where(question_id: question_id)
    total_answer_count = 0
    answer_counts.each do |i|
      total_answer_count += i.count if !i.count.nil?
    end
    total_answer_count
  end
end
