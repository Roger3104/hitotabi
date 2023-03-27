class Public::CommentsController < ApplicationController
  before_action :authenticate_user! , only: [:create, :destroy]

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    if @comment.save
      render :post_comments
    else
      render 'public/posts/show'  #!!!!!!ここでエラーが起きる
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    render :post_comments
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
