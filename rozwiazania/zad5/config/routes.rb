# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'tracks#index'

  resources :tracks
  resources :artists
  resources :playlists, only: %i[index show]
end
