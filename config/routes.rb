Rails.application.routes.draw do

  root 'items#index'
  devise_for :users
  resources :users, only: [:index, :show, :new, :update]
  resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :mypages, only: [:index, :show, :edit]
  resources :comments, only: [:create]

end
