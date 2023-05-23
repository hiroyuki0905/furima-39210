Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    get 'new', to: 'items#new', as: 'new_item'
    post 'create', to: 'items#create', as: 'create_item'
  end
  get '/users', to: 'users#index'
end

