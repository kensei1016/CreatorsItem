Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/about'

  devise_for :users
  get 'mypage', to: 'users#show', as: :mypage
  resources :users do
    resource :relationship, only: [:create, :destroy]
    member do
      get 'follows'
      get 'followers'
    end
  end

  resources :work_rooms do
    resource :favorite, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    collection do
      get 'new_items',        to: 'work_items#index_new'
      get 'recommend_items',  to: 'work_items#index_reccomend'
      get 'search',           to: 'work_items#search'
    end
  end

  resources :creator_items, only: :show
end
