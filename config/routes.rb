Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about'

  devise_for :users, :controllers => {
    :registrations => 'users/registrations'
  }
  get 'mypage', to: 'users#mypage', as: :mypage
  resources :users, only: :show do
    resource :relationship, only: [:create, :destroy]
    member do
      get 'follows'
      get 'followers'
    end
  end

  namespace :admin do
    resources :creator_genres
  end

  resources :work_rooms do
    resource :favorite, only: [:create, :destroy]
    resource :save_item, only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :update, :destroy]
    collection do
      get 'new_items',        to: 'work_rooms#index_new'
      get 'recommend_items',  to: 'work_rooms#index_recomend'
      get 'search',           to: 'work_rooms#search'
      get 'search_api',       to: 'work_rooms#search_api'
    end
  end

  resources :creator_items, only: :show
end
