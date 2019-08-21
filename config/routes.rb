Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show, :new, :edit, :update]

  get "signup", to: "signup#index"
  resources :signup do
    collection do
      get "registration"
      get "login"
    end
  end
end
