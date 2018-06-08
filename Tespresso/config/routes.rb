Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/products', to: 'products#index'
  get '/products/:id', to: 'products#show'
  get '/categories', to: 'categories#index'
  get '/categories/:id', to: 'categories#show'
  get '/user', to: 'user#index'
  get '/cart', to: 'user#cart'
  get '/legal', to: 'user#legal'
  get '/pay', to: 'cart_checkout#index'
  post '/createpayment', to: 'cart_checkout#createpayment'
  post '/executepayment', to: 'cart_checkout#executepayment'
  root 'categories#index'

end
