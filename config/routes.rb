Rails.application.routes.draw do
  root "transactions#index"

  resources :transactions
  resources :accounts
end
