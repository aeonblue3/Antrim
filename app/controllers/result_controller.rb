class ResultController < ApplicationController
  def index
    @ballots = Ballot.expired_ballots
  end

  def show
    @name = Ballot.find(params[:id]).name
    @question_text = Question.select(:question_text).where(ballot_id: params[:id])
    @answers = Answer.find params[:id]
  end
  
end
