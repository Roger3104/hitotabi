class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_path
    else
      redirect_to request.referer
    end
  end
  
  def check
  end
  
  def withdrawal
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:thank_you] = "ご利用ありがとうございました"
    redirect_to root_path
  end
  
  
  
  private
  def user_params
    params.require(:user).permit(:name, :place, :email)
  end
  
end
