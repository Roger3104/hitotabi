class SearchesController < ApplicationController
  def search
    @word = params[:word]
    @posts = Post.looks(@word).page(params[:page])
  end
end
