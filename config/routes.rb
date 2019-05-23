Rails.application.routes.draw do
  resources :stocks
  resources :transactions
  resources :watchlists
  resources :users

  post "/login", to: 'auth#login'
  get "/auto_login", to: 'auth#auto_login'
  post "/trade/buy", to: "stocks#buy_stock_and_transaction"
  post "/trade/sell", to: "stocks#sell_stock_and_transaction"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
