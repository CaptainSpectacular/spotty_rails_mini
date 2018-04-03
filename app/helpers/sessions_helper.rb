module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
    flash[:success] = "Welcome #{current_user.username}"

  end

  def log_out
    session[:user_id] = nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end