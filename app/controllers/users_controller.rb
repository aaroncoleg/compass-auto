class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    role = params[:user][:role_id]
    User.find(params[:id]).update_attributes(:role_id => role)
    redirect_to users_show_path
  end

  def user_params
    params.require(:user).permit(:role_id)
  end

end