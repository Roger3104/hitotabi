class Public::FavoritesController < ApplicationController
  
  def index
    @user = User.find_by(params[:id])
    @favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(likes)
  end

  def create
    @post = Post.find_by(params[:id])
    @post_favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id] )
    @post_favorite.save
  end

  def destroy
    @post = Post.find_by(params[:id])
    @post_favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id] )
    @post_favorite.destroy
  end

end
