helpers do

  def current_user
    if session[:user_id]
      return User.find(session[:user_id]).name
    else
      return nil
    end
  end
end