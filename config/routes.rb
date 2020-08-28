Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  # root to: 'sessions#index'
  resources :items
  # resources :users
end
