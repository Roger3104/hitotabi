class Public::HomesController < ApplicationController
  def top
    @posts = Post.published.order(created_at: :desc)
  end

  def about
  end
end
