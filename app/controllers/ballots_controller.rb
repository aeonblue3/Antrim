class BallotsController < InheritedResources::Base
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
