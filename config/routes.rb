Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users, only: [ :show, :edit, :update ]
  resources :organisations do
    resources :camps , only: [:new, :create, :destroy, :edit, :update] do
      resources :slots, only: [:new, :create, :destroy, :edit, :update]
    end
  end
  resources :camp_bookings
  resources :camp_reviews
  resources :camps, only: [:index, :show,]
  resources :slots, only: [:index, :show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
