class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?
  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue
      session.clear #pl ha be van jelentkezve egy user es kozben egy masik bongeszoben adminnal toroljuk a usert, akkor el fog szallni a find
    end
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
end
