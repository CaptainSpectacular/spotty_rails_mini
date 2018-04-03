class Admin::UsersController < Admin::BaseController
  def show
    render locals: { user: User.find(params[:id]) }
  end

  def index
    render locals: { users: User.all }
  end

  def destroy
    User.destroy(params[:id])

    redirect_to admin_users_path
  end
end
