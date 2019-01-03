Rails.application.routes.draw do
  resources :products


  # Customers controllers setup

  devise_for :customers, controllers: {
    registrations: 'registrations'
  }

  # Customers paths setup
  devise_scope :customer do
    resources :customers, controller: "registrations", only: [:index, :show] do
      resources :products, controller: "user_products", only: [:index]
    end
    #get "/customers", to: "registrations#index"

  end

  root 'products#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
