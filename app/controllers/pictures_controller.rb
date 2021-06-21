class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]
  def index
    @pictures = Picture.all
  end
  def new
    @picture =Picture.new
  end
  def create
    @picture = current_user.pictures.build(picture_params)
    if params[:back]
      render :new
      if @picture.save
        redirect_to pictures_path, notice:"投稿しました！"
      else
        render :new
    end
  end
  end
  def show
    # @picture = Picture.find(params[:id])
  end
  def edit
    # @picture = Picture.find(params[:id])
  end
  def update
    # @picture = Picture.find(params[:id])
    if @picture.update(picture_params)
      redirect_to pictures_path, notice: "編集しました！"
    else
      render :edit
    end
  end
  def destroy
  @picture.destroy
  redirect_to pictures_path, notice:"ブログを削除しました！"
  end
  def confirm
    @picture = Picture.new(picture_params)
    render :new if @blog.invalid?
  end
  private
  def picture_params
    params.require(:picture).permit(:title, :content)
  end
  def set_picture
    @picture = Picture.find(params[:id])
  end
end
