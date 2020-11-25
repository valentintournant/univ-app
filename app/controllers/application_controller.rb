class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?
  before_action :require_user

  def current_user
    #only perform this code if my @current_user exist
    @current_user ||= Student.find(session[:student_id]) if session[:student_id]
  end

  def logged_in?
    #true or false
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:notice] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

end
