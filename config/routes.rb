Rails.application.routes.draw do
  resources :invoices do
    collection do
      get :sales
      get :purchaces
    end
  end

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
