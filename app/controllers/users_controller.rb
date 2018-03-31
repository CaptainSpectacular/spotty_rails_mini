class UsersController < ApplicationController
  def show
  end

  def new
    render locals: { user: User.new }
  end

  def create
    if params[:user][:password] == params[:user][:confirm_password]
      user = User.new(user_params)
      if user.save
        log_in(user)
        redirect_to user_path(user.id)
      else
        flash.now[:danger] = 'Username already taken!'
        render 'new'
      end
    else
      flash.now[:danger] = 'Passwords do not match!'
      render 'new'
    end
  end

  def edit
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
