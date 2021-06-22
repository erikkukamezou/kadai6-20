class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @picture =@user.pictures

    bookmarks =Bookmark.where(user_id: current_user.id).pluck(:picture_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    @bookmark_list = Picture.find(bookmarks)     # postsテーブルから、お気に入り登録済みのレコードを取得
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "編集しました！"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :image ,:image_cache)
  end
end
