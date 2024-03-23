Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root "items#index"
  resources :items
  resources :items do
    resources :purchases, only: [:index, :new, :create]
  end
end
