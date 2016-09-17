Rails.application.routes.draw do
  resources :movements
  resources :reservas do
    resources :payments
    resources :deposits
    resources :passengers
  end
  resources :wholesalers
  resources :retails

  root to: 'reservas#index'
end
