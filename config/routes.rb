Rails.application.routes.draw do
  get 'users/new'
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index'
  resources :posts
  resources :pets
  resources :users
end

