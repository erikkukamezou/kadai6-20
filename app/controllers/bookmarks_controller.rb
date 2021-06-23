class BookmarksController < ApplicationController
  def create
    bookmark = current_user.bookmarks.create(picture_id: params[:picture_id])
    redirect_to pictures_path, notice: "#{bookmark.picture.user.name}さんのブログをお気に入り登録しました"
  end
  def destroy
    bookmark = current_user.bookmarks.find_by(id: params[:id]).destroy
    redirect_to pictures_path, notice: "#{bookmark.picture.user.name}さんのブログをお気に入り解除しました"
  end
end
