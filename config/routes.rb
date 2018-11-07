# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :pets
  resources :users
  resources :sessions, only: %i[new create destroy]
  delete '/logout',  to: 'sessions#destroy'
  root 'posts#index'
end
