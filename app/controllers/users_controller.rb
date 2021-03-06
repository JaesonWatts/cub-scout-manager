class UsersController < ApplicationController

  #loading signup form
  def new 
    @user = User.new
  end

  #signup
  def create
    @user = User.new(user_params(:first_name,:last_name, :email, :password, :password_confirmation))
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
   
      render :new
    end
  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end
 
  def login_required
    unless current_user
      flash[:error] = 'You must be logged in to view this page.'
      redirect_to login_path
    end
  end


end
