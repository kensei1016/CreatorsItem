class CreatorGenre < ApplicationRecord
  has_and_belongs_to_many :users

  attachment :genre_image
  attachment :genre_icon_image
end
