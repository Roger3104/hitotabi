class Public::CommentsController < ApplicationController
  before_action :authenticate_user! , only: [:create, :destroy]
  before_action :set_post , only: [:create, :destroy]

  def create
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    if @comment.save
      render :post_comments
    else
      render 'public/posts/show'  #!!!!!!ここでエラーが起きる
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    render :post_comments
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
