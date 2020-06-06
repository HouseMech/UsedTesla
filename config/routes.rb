Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'data/index'
  root 'data#index'

  resources :vehicles, only: [:index, :show]
  get '/sold', to: 'vehicles#sold'
end
