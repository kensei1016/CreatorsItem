class WorkRoom < ApplicationRecord
  belongs_to :user
  belongs_to :creator_genre
  has_many :save_items,         dependent: :destroy
  has_many :creator_items,      dependent: :destroy
  has_many :work_room_images,   dependent: :destroy

  accepts_attachments_for :work_room_images, attachment: :image

  acts_as_taggable
  # acts_as_taggable_on :tags と同じ意味

end
