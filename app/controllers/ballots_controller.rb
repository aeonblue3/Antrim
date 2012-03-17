class BallotsController < InheritedResources::Base
  before_filter :authorize, only: [:show, :update]

  def index
    @ballot = Ballot.available_ballots
  end

  def show
    if @current_user.has_voted? params[:id]
      redirect_to root_url, alert: "You have already voted in this ballot!"
    end
    @ballot = Ballot.find params[:id]
  end
  def new
    @ballot = Ballot.new
    
    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @ballot }
    end
  end
  def update
    @posted = params[:answer]
    @posted.each do |key, value|
      a = Answer.find key
      a.count.nil? ? a.count = 1 : a.count += 1
      a.save
    end
    @current_user.update_voting_status params[:id]
    redirect_to root_url, notice: "Successfully Submitted!!"
  end
end
