Rails.application.routes.draw do
  #get 'users/show'を削除。下のusersとの重複回避のため。
  devise_for :users
  root to: 'homes#top'
  resources :post_images, only: [:new, :create, :index, :show, :destroy]

  resources :users, only: [:show, :edit, :update]
end
