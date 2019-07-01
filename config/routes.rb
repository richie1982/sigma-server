Rails.application.routes.draw do
  resources :user_products, only: [:create, :destroy]
  resources :products, only: [:create]
  resources :users, only: [:show, :create]

  post '/log_in', to: 'users#log_in'
  get '/inventory', to: 'users#inventory'
  get '/validate', to: 'users#validate'
  delete '/delete', to: 'user_products#delete_product'

  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
