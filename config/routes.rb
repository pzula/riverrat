Riverrat::Application.routes.draw do
  resources :users

  root "pages#home"

  namespace :api do
    namespace :v1 do
      resources :gauges, only: [:index]
    end
  end
 end
