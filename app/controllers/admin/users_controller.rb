class Admin::UsersController < Admin::BaseController
  def edit
    render locals: { user: User.find(params[:id]) }
  end
  
  def update
    user = User.find(params[:id])
    if user.update(user_params)
      flash[:success] = 'User updated'
      redirect_to edit_admin_user_path(user)
    else
      flash.now[:danger] = "Invalid attributes"
      render :edit, locals: { user: user }
    end
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "#{user.username} has been created"
      redirect_to admin_users_path
    else
      flash.now[:danger] = "Invalid attributes"
      render :new
    end
  end

  def index
    render locals: { users: User.all }
  end

  def destroy
    User.destroy(params[:id])

    redirect_to admin_users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :role)
  end
end
