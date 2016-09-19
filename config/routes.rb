Rails.application.routes.draw do
  resources :reservas do
    resources :payments
    resources :deposits
    resources :passengers
  end

  resources :wholesalers
  resources :retailers

  resources :operators do
    resources :movements
  end

  resources :movements

  root to: 'reservas#index'
end
