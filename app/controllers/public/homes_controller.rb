class Public::HomesController < ApplicationController
  def top
    @posts = Post.published.page(params[:page])
  end

  def about
  end
end
