Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/products', to: 'products#index'
  get '/products/:id', to: 'products#show'
  get '/categories', to: 'categories#index'
  get '/categories/:id', to: 'categories#show'
  get '/user', to: 'user#index'
  root 'categories#index'

end
