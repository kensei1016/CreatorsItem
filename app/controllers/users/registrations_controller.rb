# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  def create
    super
    # クリエイタージャンル設定処理
    if resource.errors.empty?
      save_creator_genre(resource)
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    super
    if resource.errors.empty?
      save_creator_genre(resource)
    end
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  def save_creator_genre(resource)
    return unless resource.instance_of?(User)
    creator_genre_ids = nil
    if params[:user][:creator_genres].present?
      creator_genre_ids = params[:user][:creator_genres]
    elsif params[:user][:creator_genre_ids].present?
      creator_genre_ids = params[:user][:creator_genre_ids]
    end
    if creator_genre_ids.present?
      # 現在の設定を一度クリアする
      resource.creator_genres.destroy_all
      # 配列の最初の要素は空で来るためsliceする
      creator_genre_ids.slice(1..-1).each do |creator_genre_id|
        unless resource.creator_genres.exists?(creator_genre_id)
          resource.creator_genres << CreatorGenre.find(creator_genre_id)
        end
      end
    end
  end

  protected
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    mypage_path
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
