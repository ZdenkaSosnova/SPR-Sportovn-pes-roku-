Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  resources :dogs
  get "signup", to: "owners#new"
  resources :owners, except: [:new]
  resources :members, only: [:index]
  resources :herdings
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  resources :sports
end
