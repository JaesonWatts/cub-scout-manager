class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  def authentication_required
    if !logged_in?
      redirect_to login_path
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user        
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


end
