Rails.application.routes.draw do
  #get 'users/show'を削除。下のusersとの重複回避のため。
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit]

  resources :users, only: [:show, :edit, :update, :index, :create]
end
