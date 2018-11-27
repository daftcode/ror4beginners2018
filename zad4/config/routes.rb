Rails.application.routes.draw do
  get 'players', to: "players#index", as: :players
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
