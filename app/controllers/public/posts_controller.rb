class Public::PostsController < ApplicationController
  before_action :authenticate_user! , only: [:edit, :create, :destroy]

  def new
    @post = Post.new
    @categories = Category.all
  end

  def create
    @tags = Tag.all
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if  @post.save
      if params[:post][:tags].present?
        params[:post][:tags].each do |tag_id| # ポストの保存にせいこうしたらに紐づくタグを保存する
          if tag_id.present?
            PostTag.new(post: @post, tag_id: tag_id).save
          end
        end
      end
      redirect_to post_path(@post)
      flash[:success] = 'Success!'
    else
      @categories = Category.all
      render 'new'
    end
  end

  def confirm
    @posts = current_user.posts.draft
  end

  def index
    @posts = Post.published.shuffle
  end

  def show
    @post = Post.find(params[:id])
    @tags = @post.tag_id
    @user = @post.user
    @comment = Comment.new
    # @post_tags = PostTag.where(post_id: @post.id).pluck(:tag_id)
    # @related_posts = @post_tags.posts.published.sort_by{rand}.first(15)
  end

  def edit
    @post = Post.find(params[:id])
    @categories = Category.all
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(edit_post_params)
      redirect_to post_path(@post)
      flash[:success] = 'Success!'
    else
      @categories = Category.all
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_index_path(current_user.id)
    flash[:success] = 'Deleted!'
  end



  private

    def post_params
      params.require(:post).permit(:user_id, :title, :date, :content, :address, :latitude, :longitude, :image, :status)
    end

    def edit_post_params
      params.require(:post).permit(:user_id, :title, :date, :content, :address, :latitude, :longitude, :image, :status).merge(tag_ids: params[:post][:tags].reject(&:empty?))
    end
end


