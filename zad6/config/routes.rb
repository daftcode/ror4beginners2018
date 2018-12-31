Rails.application.routes.draw do
  resources :products, only: :index
  resources :customers, only: :index do
    scope module: :customers do
      resources :products, only: :index
    end
  end
end
