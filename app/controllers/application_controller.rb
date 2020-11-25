class ApplicationController < ActionController::Base

helper_method :current_user, :logged_in?

def current_user
  #only perform this code if my @current_user exist
  @current_user ||= Student.find(session[:student_id]) if session[:student_id]
end

def logged_in?
  #true or false
  !!current_user
end

end
