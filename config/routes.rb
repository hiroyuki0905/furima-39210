Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  
  resources :items, except: [:edit] do
    member do
      get :edit
      patch :update
    end
  end 
end