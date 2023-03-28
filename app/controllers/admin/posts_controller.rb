class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def show
    @post = Post.find(params[:id])
    @tags = @post.tag_id
    @user = User.find_by(params[:id])
    @comment = Comment.new
  end

  def index
    @posts = Post.published
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end


  private

      def post_params
        # params.require(:post).permit(:user_id, :title, :date, :content, :address, :latitude, :longitude, :image, :status).merge(tag_ids: params[:post][:tags].reject(&:empty?))
        params.require(:post).permit(:user_id, :title, :date, :content, :address, :latitude, :longitude, :image, :status)
        # params.require(:post).permit(:user_id, :title, :date, :content, :address, :latitude, :longitude, :image, :status, tags: [])
      end
end
