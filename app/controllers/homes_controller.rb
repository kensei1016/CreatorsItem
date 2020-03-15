class HomesController < ApplicationController
  def top
    @work_rooms = WorkRoom.all.includes([:creator_genre]).includes([:user])
  end

  def about
  end
end
