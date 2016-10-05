Rails.application.routes.draw do
  resources :invoices
  resources :reservas do
    resources :payments
    resources :deposits
    resources :passengers
  end

  namespace :wholesalers do
    resources :invoices
  end

  namespace :retailers do
    resources :invoices
  end

  resources :wholesalers
  resources :retailers

  resources :operators do
    resources :movements
  end

  resources :movements

  root to: 'reservas#index'
end
