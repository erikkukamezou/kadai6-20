class Picture < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_pictures, through: :favorites, source: :user
  has_many :contacts
  # def bookmarked_by?(user)
  #   bookmarks.where(user_id: user).exists?
  # end
end
