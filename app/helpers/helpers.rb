  def current_user
    if session[:user_id] != nil
      return User.find(session[:user_id])
    else
      return nil
    end
  end
