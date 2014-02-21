Riverrat::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions

  root "pages#home"

  namespace :api do
    namespace :v1 do
      resources :gauges, only: [:index]
    end
  end
 end
