Rails.application.routes.draw do

  resources :categories
  get 'home/index'
  root 'home#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  resources :articles do
    resources :comments, only: [:create, :destroy]
    member do
      put 'like', to: 'articles#like'
      put 'unlike', to: 'articles#unlike'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
