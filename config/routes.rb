Rails.application.routes.draw do
  root 'users#index'

  resources :users
  resource :employment_terms, only: %i[new create]
  resources :positions, except: %i[show destroy]
  resource :divisions, only: [:show]
end
