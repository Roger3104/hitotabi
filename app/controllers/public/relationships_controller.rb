class Public::RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    current_user.follow(@user.id)
    render :replace
  end

  def destroy
    @user = User.find(params[:user_id])
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
end
