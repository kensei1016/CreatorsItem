class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search_work_room


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :creator_genre_ids])
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile_image, :name, :caption, :creator_genre_ids])
  end

  private
  def set_search_work_room
    # 検索バー表示のために常に@qを生成する
    @q = WorkRoom.ransack(params[:q])
  end
end
