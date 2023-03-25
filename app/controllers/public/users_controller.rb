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
    @tags = @user.tag_ids
  end

  def user_index
    @user = User.find(params[:id])
    @posts = @user.posts.published.page(params[:page])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
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
    @favorite_posts = Post.where(id: favorites).page(params[:page])
  end

  def recommend
    @user = current_user
    # @user_tags = UserTag.where(user_id: @user.id).pluck(:tag_id).sort_by{rand}.first(3)
    # @posts = Post.published.joins(:post_tags).where('post_tags.tag_id in (?)', @user_tags).page(params[:page])
    @posts = {}
    UserTag.where(user_id: @user.id).pluck(:tag_id).sort_by{rand}.first(3).each do |tag_id|
      @posts[tag_id] = Post.published.joins(:post_tags).where('post_tags.tag_id = ?', tag_id).sort_by{rand}.first(3)
    end
  end




  private

  def user_params
    params.require(:user).permit(:name, :place, :email, :tag_id)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
