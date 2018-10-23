Rails.application.routes.draw do
  resources :roles
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get '/auth/:provider/callback', to: 'sessions#create'
end
