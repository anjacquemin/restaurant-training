Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :show, :create, :new, :destroy] do
    resources :rentals, only: [:create]
    resources :reviews, only: [:edit, :update, :destroy]
  end

  resources :rentals, only: [:index] do
    resources :reviews, only: [:create]
  end


end
