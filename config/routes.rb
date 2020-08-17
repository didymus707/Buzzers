Rails.application.routes.draw do

  resources :categories
  get 'home/index'
  root 'home#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
