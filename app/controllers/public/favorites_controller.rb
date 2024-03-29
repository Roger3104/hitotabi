class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @post = Post.find(params[:post_id])
    post_favorite = @post.favorites.new(user_id: current_user.id)
    post_favorite.save
    render :replace
  end

  def destroy
    @post = Post.find(params[:post_id])
    post_favorite = @post.favorites.find_by(user_id: current_user.id)
    post_favorite.destroy
    render :replace
  end

end
