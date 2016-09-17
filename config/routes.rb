Rails.application.routes.draw do
  resources :reservas do
    resources :payments
    resources :deposits
    resources :passengers
  end
  resources :wholesalers do
    resources :movements
  end

  resources :retails do
    resources :movements
  end

  root to: 'reservas#index'
end
