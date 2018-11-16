# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  resources :pets
  resources :users
  resource :sessions, only: %i[new create destroy]
  root 'posts#index'
end
