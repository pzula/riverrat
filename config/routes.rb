Riverrat::Application.routes.draw do
  resources :users
  resources :sessions

  root "pages#home"
 end
