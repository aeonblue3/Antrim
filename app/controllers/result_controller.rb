class ResultController < ApplicationController
  def index
    @ballots = Ballot.expired_ballots
  end

  def show
  end
end
