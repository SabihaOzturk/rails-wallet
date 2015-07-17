class SessionsController < ApplicationController
  def new
    session[:user_id] = nil
  end
  
  def create
    user = User.find_by_email(params[:email])
    
      if user.password == params[:password]
        session[:user_id] = user.id
        flash[:welcome] = "Welcome"
        redirect_to users_path
    else
      flash[:alert] = "Invalid Credentials"
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:alert] = "Logged Out"
    redirect_to root_path
  end
end
