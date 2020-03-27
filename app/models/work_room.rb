class WorkRoom < ApplicationRecord
  belongs_to :user
  belongs_to :creator_genre
  has_many :save_items,         dependent: :destroy
  has_many :creator_items,      dependent: :destroy
  has_many :work_room_images,   dependent: :destroy
  has_many :favorites,          dependent: :destroy
  has_many :comments,           dependent: :destroy

  validate :work_room_images_count
  validates :creator_genre,     presence: true
  validates :caption,           length: { maximum: 300 }

  accepts_nested_attributes_for :creator_items, allow_destroy: true
  accepts_attachments_for :work_room_images, attachment: :image

  acts_as_taggable
  # acts_as_taggable_on :tags と同じ意味

  is_impressionable


  public

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

  def favorite_count
    favorites.count
  end


  private

  def work_room_images_count
    errors.add(:work_room_images, "を1枚以上指定して下さい") if work_room_images.size < 1
    errors.add(:work_room_images, "は5枚まで投稿可能です") if work_room_images.size > 5
  end

end
