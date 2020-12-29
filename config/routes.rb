Rails.application.routes.draw do
  devise_for :controllers
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  resources :cocktails, only: %i[index show new create] do
    resources :doses, only: %i[new create]
  end
  resources :doses, only: [:destroy]
end
