Rails.application.routes.draw do
  resources :customers, only: :index do 
    get '/products', to: 'customers#customer_products'
  end 

  root 'customers#index'

  resources :products, only: :index
end
