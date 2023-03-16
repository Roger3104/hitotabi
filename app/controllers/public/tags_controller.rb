class Public::TagsController < ApplicationController
  
  def index
    @categories = Category.all
  end
  def show
    @tags = Tag.all
    @tag = Tag.find(params[:id])
    @tag_posts = @tag.posts.all.order("created_at DESC").page(params[:page])
  end
end
