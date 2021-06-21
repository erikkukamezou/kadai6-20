class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end
  def new
    @picture =Picture.new
  end
  def create
    Picture.create(picture_params)
    # @picture = current_user.picture.build(picture_params)
    if @picture.save
    redirect_to pictures_path, notice:"投稿しました！"
  else
    render :new
  end
  def show
    @picture = Picture.find(params[:id])
  end
  private
  def picture_params
    params.require(:picture).permit(:title, :content)
  end
end
