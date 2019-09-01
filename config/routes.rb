Rails.application.routes.draw do

  root 'items#index'
  devise_for :users
  resources :users, only: [:index, :show, :new, :update]
  resources :mypages, only: [:index, :show, :edit]

  resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :comments, only: [:new, :create, :show]
  end

end
