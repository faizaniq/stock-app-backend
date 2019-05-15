Rails.application.routes.draw do
  resources :stocks
  resources :transactions
  resources :watchlists
  resources :users

  post "/login", to: 'auth#login'
  get "/auto_login", to: 'auth#auto_login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
