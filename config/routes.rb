Rails.application.routes.draw do
  resources :inquiries
  resources :houses
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'}
  resources :users, :only => [:show, :index, :destroy, :edit, :update, :new, :create]
  resources :companies
  resources :searches
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  as :user do
  get 'users', :to => 'users#show', :as => :user_root # Rails 3
  end

  root to: 'home#index'
end
