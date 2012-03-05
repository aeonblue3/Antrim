class BallotsController < InheritedResources::Base
  def index
    
    #@ballot = Ballot.find :all, :conditions => ["start < ?", 1.minute.ago]
    @ballot = Ballot.where("start < :today AND end > :today", {:today => Time.now})
  end

  def show
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
end
