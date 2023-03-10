class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if params[:post]
      if @post.save(context: :publicize)
        redirect_to post_path(@post)
      else
        render 'new'
      end
    else
      if @post.update(is_draft: true)
        redirect_to users_path(@post), notice: "レシピを下書き保存しました！"
      else
        flash[:danger] = "入力内容に不備があります。<br>・#{@item.errors.full_messages.join('<br>・')}"
        # render "new"
        redirect_to request.referer
      end
    end
  end



  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end


  private
    def post_params
      params.require(:post).permit(:user_id, :tag_id, :title, :date, :content, :address, :latitude, :longitude, :image, :is_draft)
    end
end


