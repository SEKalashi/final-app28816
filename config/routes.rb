Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users, only:[:index, :edit, :show, :update, :destroy]
  resources :contents
end