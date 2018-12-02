Rails.application.routes.draw do
  resources :inventories
  resources :models
  resources :quotes do
    collection do
      post :mark_sold
      post :undo_sale
    end
  end
  resources :roles
  resources :colors
  resources :customers
  resources :makes
  resources :states

  devise_for :users, :controllers => { registrations: 'registrations'}
  resources :users, :only => [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  match '/account' => 'pages#account', :via => [:get], :as => 'account_show'
  match '/dealership' => 'pages#dealership', :via => [:get], :as => 'dealership_show'
  match '/users' => 'pages#users', :via => [:get], :as => 'users_show'
  get '/quotes_sold' => 'quotes#sold_quotes', :via => [:get], :as => 'sold_quotes'
  match '/quotes/:id/finance'=> 'quotes#finance', :via => [:get], :as => 'finance_show'
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/fetch_finance' => 'quotes#show_finance', as: 'fetch_finance', :controller => 'quotes'
  patch 'users/:id', controller: 'users', action: :update
  match '/quotes/:id' => 'quotes#download', :via => [:get], :as => 'download_quote'
end