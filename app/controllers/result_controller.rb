class ResultController < ApplicationController
  def index
    @active_ballots = Ballot.available_ballots
    @expired_ballots = Ballot.expired_ballots
  end

  def show
    @name = Ballot.find(params[:id]).name
    @question_text = Question.select("id, question_text").where(ballot_id: params[:id])

  end

end
