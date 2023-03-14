class Public::FavoritesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    post_favorite = @post.favorites.new(user_id: current_user.id)
    post_favorite.save
  end

  def destroy
    @post = Post.find(params[:post_id])
    post_favorite = @post.favorites.find_by(user_id: current_user.id)
    post_favorite.destroy
  end

end
