Rails.application.routes.draw do
  resources :movements
  resources :reservas do
    resources :payments
    resources :deposits
    resources :passengers
  end
  resources :operators

  root to: 'reservas#index'
end
