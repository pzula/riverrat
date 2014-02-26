Riverrat::Application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions

  root "pages#home"

  resources :rivers, only: [:show] do
    #resources :favorites, only: [:create]
    match 'favorites', to: 'favorites#create', via: [:post]
    match 'favorites', to: 'favorites#destroy', via: [:delete]
  end

  namespace :api do
    namespace :v1 do
      resources :gauges, only: [:index]
    end
  end
 end
