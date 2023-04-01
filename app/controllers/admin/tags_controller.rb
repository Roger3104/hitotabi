class Admin::TagsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_tag, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path
    else
      @tags = Tag.all
      render "index"
    end
  end

  def edit
  end

  def update
    if @tag.update(tag_params)
      redirect_to admin_tags_path
    else
      render "edit"
    end
  end

  def destroy
    @tag.destroy
    redirect_to admin_tags_path
  end


  private

    def tag_params
      params.require(:tag).permit(:name, :category_id)
    end

    def set_tag
      @tag = Tag.find(params[:id])
    end
end
