Rails.application.routes.draw do
  root "transactions#index"

  resources :ledgers
  resources :transactions
end
