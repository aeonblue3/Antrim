class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_key(params[:key])
    if user
      session[:key] = user.id
      session[:ballots] = user.ballots
      redirect_to root_url, notice: "Logged In!"
    else
      flash.now.alert = "Could not validate your login credentials!"
      render "new"
    end
  end
  
  def destroy
    session[:key] = nil
    session[:ballots] = nil
    redirect_to root_url, notice: "Logged Out!"
  end
end
