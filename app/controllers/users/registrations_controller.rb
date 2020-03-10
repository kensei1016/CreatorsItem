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
      creator_genre_ids = params[:user][:creator_genres]
      if creator_genre_ids.present?
        # 配列の最初の要素は空で来るためsliceする
        creator_genre_ids.slice(1..-1).each do |creator_genre_id|
          unless current_user.creator_genres.exists?(creator_genre_id)
            current_user.creator_genres << CreatorGenre.find(creator_genre_id)
          end
        end
      end
    end
    # 他のジャンルであれば新規登録して、ユーザに関連付ける
    if params[:creator_other_genre_check].present? && params[:creator_other_genre].present?
      # TODO: name_enは英訳して入れたい
      creator_genre = CreatorGenre.create!(name: params[:creator_other_genre], name_en: params[:creator_other_genre])
      current_user.creator_genres << creator_genre
    end

  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

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

  # protected

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
