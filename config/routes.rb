Rails.application.routes.draw do
  get 'camps/title:string'

  get 'camps/description:text'

  get 'camps/language:string'

  get 'camps/address:string'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
