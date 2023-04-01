class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_user, only: [:create, :destroy]

  def create
    @post = Post.find(params[:post_id])
    current_user.follow(@user.id)
    render :replace
  end

  def destroy
    @post = Post.find(params[:post_id])
    current_user.unfollow(@user.id)
    render :replace
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

  def show
    @user = current_user
    @users = @user.followings
     #user.posts.published.order(created_at: :desc).first
  end



  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
