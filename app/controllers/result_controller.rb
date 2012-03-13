class ResultController < ApplicationController
  def index
    @ballots = Ballot.expired_ballots
  end

  def show
    @name = Ballot.find(params[:id]).name
    @answers = Answer.find params[:id]
  end
end
