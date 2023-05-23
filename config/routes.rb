Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
  get '/users', to: 'users#index'
  root to: 'articles#index'
  resources :articles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
end

