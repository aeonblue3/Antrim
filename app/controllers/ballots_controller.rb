class BallotsController < InheritedResources::Base
  def index
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
  def update
    @posted = params[:answer]
    @posted.each do |key, value|
      a = Answer.find key
      if a.count.nil?
        a.count = 1
      else
        a.count += 1
      end
      if a.save
        flash[:notice] = "Successfully submitted!"
      else
        flash[:notice] = "Failed to submit!"
      end
    end
  end
end
