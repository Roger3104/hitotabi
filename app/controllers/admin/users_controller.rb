class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :edit, :update]


  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to admin_user_path(user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :place, :is_deleted, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
