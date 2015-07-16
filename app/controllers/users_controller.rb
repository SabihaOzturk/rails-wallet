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

def show
    @user = User.find params[:id]
end

def edit
  @user = User.find params[:id]
end

def update
  @user = User.find params[:id]

  p = user_params

  if user_params[:password].blank?
    p.delete(:password)
    p.delete(:password_confirmation)
  end

  @user.update! p

  flash[:notice] = "Successful update"
  redirect_to user_path(@user)
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

