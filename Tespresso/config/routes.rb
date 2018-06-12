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
  get '/contact', to: 'user#contact'
  get '/edit', to: 'user#edit'
  get '/modify', to: 'user#modify'
  get '/addProduct/:id', to: 'order_manager#addProductToCart'
  get '/completed/:id', to: 'order_manager#orderCompleted'
  get '/delOrdItem/:id', to: 'order_manager#deleteOrderItem'
  get '/pay/:id', to: 'cart_checkout#home'
  post '/createpayment/:id', to: 'cart_checkout#createpayment'
  post '/executepayment', to: 'cart_checkout#executepayment'
  root 'categories#index'

end
