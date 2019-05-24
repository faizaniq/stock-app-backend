Rails.application.routes.draw do
  resources :stocks
  resources :transactions
  resources :watchlists
  resources :users

  post "/login", to: 'auth#login'
  get "/auto_login", to: 'auth#auto_login'
  post "/buy", to: "stocks#buytransaction"
  post "/sell", to: "stocks#selltransaction"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
