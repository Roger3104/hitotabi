class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def index
  end

  def show
    if params[:format].present?
      @user = User.find(params[:format])
      @post = Post.find(params[:id])
      @posts = @user.posts.published.page(params[:page])
    else
      @user = current_user
      @posts = @user.posts.published.page(params[:page])
    end
    @tags = @user.tags
  end

  def user_index
    @user = User.find(params[:id])
    @posts = @user.posts.published
  end

  def edit
    @user = current_user
    @categories = Category.all
  end

  def update
    @user = current_user
    if @user.update(edit_user_params)
      redirect_to users_path
    else
      redirect_to request.referer
    end
  end

  def check
  end

  def withdrawal
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:thank_you] = "ご利用ありがとうございました"
    redirect_to root_path
  end

  def favorites
    @user = current_user
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.where(id: favorites)
  end

  def recommend
    @user = current_user
    # @user_tags = UserTag.where(user_id: @user.id).pluck(:tag_id).sort_by{rand}.first(3)
    # @posts = Post.published.joins(:post_tags).where('post_tags.tag_id in (?)', @user_tags).page(params[:page])
    @posts = {}
    UserTag.where(user_id: @user.id).pluck(:tag_id).sort_by{rand}.first(5).each do |tag_id| #ユーザーが持っているタグをランダムに並べ替えて最初の3個を取得
      @posts[tag_id] = Post.published.joins(:post_tags).where('post_tags.tag_id = ?', tag_id).sort_by{rand}.first(9)#それぞれ9件表示
    end
  end




  private

  def user_params
    params.require(:user).permit(:name, :place, :email, :tag_ids)
  end

  def edit_user_params
    params.require(:user).permit(:name, :place, :email).merge(tag_ids: params[:user][:tags].reject(&:empty?))
  end

  def set_user
    @user = User.find(params[:id])
  end

end
