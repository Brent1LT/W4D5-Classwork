class SessionsController < AppplicationController
  def create 
    user = User.find_by(user: :username, user: :password)

    if user 
      session[:session_token] = user.generate_session_token
    end 
    redirect_to user_url(user)
  end 
end 