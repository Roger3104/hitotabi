class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
    # @categories = Category.all
    # @category = Category.find(params[:category_id])
    # @tags = @category.tags
  end

  def create
    @tags = Tag.all
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if  @post.save
      # ポストの保存にせいこうしたらに紐づくタグを保存する
      params[:post][:tags].each do |tag_id|
        if tag_id.present?
          PostTag.new(post: @post, tag_id: tag_id).save
        end
      end

      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def confirm
    @posts = current_user.posts.draft
  end



  def show
    @post = Post.find(params[:id])
    @tags = @post.tag_id
  end

  def index
    @posts = Post.published
  end

  def edit
    @post = Post.find(params[:id])

  end


  private

    def post_params
      params.require(:post).permit(:user_id, :title, :date, :content, :address, :latitude, :longitude, :image, :status)
    end
end


