class UsersController < ApplicationController
def new
  @user = User.new
end

def index
  @users = User.all
  redirect_to new_session_path unless current_user
end

def create
  @user = User.create user_params
  if @user.valid?
    flash[:alert] = "Thank you for join us"
    redirect_to users_path
  else
    flash[:alert] = "Something wrong, try again please"
    render :new
  end
end

def destroy
    @user = User.find params[:id]
    @user.destroy!
    session.clear
    flash[:success] = "User deleted"
    redirect_to root_path
  end


private

  def user_params
    params.require(:user).permit(:email, 
                                 :phone, 
                                 :fname, 
                                 :lname, 
                                 :password, 
                                 :password_confirmation )
  end
end

