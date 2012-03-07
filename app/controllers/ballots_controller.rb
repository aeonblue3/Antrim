class BallotsController < InheritedResources::Base
  before_filter :authorize, only: [:show, :update]
  before_filter
  
  def index
    @ballot = Ballot.where("start < :today AND end > :today", {:today => Time.now})
  end

  def show
    if current_user.ballots.split(':').include?("#{params[:id]}")
      redirect_to root_url, alert: "You have already voted in this ballot!"
    end
    
    @ballot = Ballot.find params[:id]
  end
  def new
    @ballot = Ballot.new
    
    3.times do
      questions = @ballot.questions.build
      4.times { questions.answers.build }
    end
    
    respond_to do |format|
      format.html # new.html.haml
      format.json { render json: @ballot }
    end
  end
  def update
    if current_user.ballots.nil?
      current_user.ballots = params[:id]
      current_user.save
    elsif current_user.ballots.split(':').include?("#{params[:id]}")
      redirect_to root_url, alert: "You have already voted in this ballot!"
    else
      current_user.ballots += ":#{params[:id]}"
      current_user.save
    end
    
    @posted = params[:answer]
    @posted.each do |key, value|
      a = Answer.find key
      if a.count.nil?
        a.count = 1
      else
        a.count += 1
      end
      if a.save
        params = nil
        redirect_to root_url, notice: "Successfully submitted!"
      else
        params = nil
        redirect_to root_url, alert: "Failed to submit!"
      end
    end
  end
end
