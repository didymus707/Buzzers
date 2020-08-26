Rails.application.routes.draw do

  root 'home#index'
  resources :categories
  resource :home, only: [:index]
  resources :sessions, only: [:new, :create, :destroy]
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
