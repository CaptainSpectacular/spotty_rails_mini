class Admin::UsersController < Admin::BaseController
  def show
    render locals: { user: User.find(params[:id]) }
  end

  def index
    render locals: { users: User.all }
  end
end
