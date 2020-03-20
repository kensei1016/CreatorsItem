class WorkRoom < ApplicationRecord
  belongs_to :user
  belongs_to :creator_genre
  has_many :save_items,         dependent: :destroy
  has_many :creator_items,      dependent: :destroy
  has_many :work_room_images,   dependent: :destroy
  has_many :favorites,          dependent: :destroy
  has_many :comments,           dependent: :destroy

  accepts_nested_attributes_for :creator_items, allow_destroy: true
  accepts_attachments_for :work_room_images, attachment: :image

  acts_as_taggable
  # acts_as_taggable_on :tags と同じ意味

  is_impressionable

  def favorited_by?(user)
    return false unless user.instance_of?(User)
    # この投稿のいいねにユーザが含まれているかチェック
    favorites.any? {|favorite| favorite.user_id == user.id}
  end

  def save_item_by?(user)
    return false unless user.instance_of?(User)
    # この投稿のいいねにユーザが含まれているかチェック
    save_items.any? {|save_item| save_item.user_id == user.id}
  end
end
