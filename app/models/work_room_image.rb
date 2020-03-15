class WorkRoomImage < ApplicationRecord
  belongs_to :work_room
  attachment :image
end
