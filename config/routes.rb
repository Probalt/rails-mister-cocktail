Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, only: [:show, :new, :create] do
    resources :doses, only: [:show, :new, :create]
  end
  resources :doses, only: [:destroy]
end
