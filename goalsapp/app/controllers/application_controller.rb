class ApplicationController < ActionController::Base
  helper_methods :current_user, :logged_on?

  def logged_on?
    !!@current_user
  end 

  def login!(user) 
    user.session_token = session[:session_token]
  end
  
  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end
  
  def log_out!
    current_user.generate_session_token if current_user
    session[:session_token] = nil 
  end
end
