class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :work_room
end
