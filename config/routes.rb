Rails.application.routes.draw do

  root 'items#index'
  devise_for :users
  resources :users, only: [:index, :show, :new, :edit, :update]
  resources :items, only: [:index, :show, :new]
  resources :mypages, only: [:index]

end
