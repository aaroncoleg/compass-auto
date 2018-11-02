Rails.application.routes.draw do
  resources :quotes
  resources :roles
  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :users, :only => [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  match '/account' => 'pages#account', :via => [:get], :as => 'account_show'
  match '/users' => 'pages#users', :via => [:get], :as => 'users_show'
  get 'users/:id' => 'pages#account'
  get '/auth/:provider/callback', to: 'sessions#create'
  patch 'users/:id', controller: 'users', action: :update
end