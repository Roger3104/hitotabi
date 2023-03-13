class Public::TagsController < ApplicationController
  def show
    @tags = Tag.all
    @tag = Tag.find(params[:id])
    @tag_post = @tag.posts.all.order("created_at DESC").page(params[:page])
  end
end
