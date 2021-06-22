class PicturesController < ApplicationController
  before_action :login_check, only: [:edit, :update,]
  #before_action :authenticate_user!
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
    else
      if @picture.save
        redirect_to pictures_path, notice:"投稿しました！"
        NotificationMailer.send_confirm_to_picture(@picture).deliver
      else
        render :new
      end
      if @picture.user == current_user
          render "edit"
        else
          redirect_to pictures_path
      end
    end
  end

  def show
    # @picture = Picture.find(params[:id])
    @picture = Picture.includes(:user).find(params[:id])
    @bookmark = current_user.bookmarks.find_by(picture_id: @picture.id)
  end

  def edit
    # @picture = Picture.find(params[:id])
    # @picture = Picture.find(params[:id])
        # 　if @picture.user == current_user
        #     render "edit"
        #   else
        #     redirect_to pictures_path
        #   end
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
    @picture = current_user.pictures.build(picture_params)
    render :new if @picture.invalid?
  end

  # def mypage
  # @bookmarks = Bookmark.where(user_id: current_user.id)
  # end

  private
  def picture_params
    params.require(:picture).permit(:title, :content, :image, :image_cache)
  end
  #
  def login_check
    unless Picture.find(params[:id]).user_id == current_user.id
      flash[:alert] = "ログインしてください"
      redirect_to new_session_path
    end
  end
  # class PhotosController < ApplicationController

  def set_picture
    @picture = Picture.find(params[:id])
  end
end
