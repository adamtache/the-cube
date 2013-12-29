TheCube::Application.routes.draw do

  # routes injected by other libraries
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  # root
  root to: "main#home"
  
  # main pages
  get "about", to: "main#about"
  get "join", to: "main#join"
  get "gallery", to: "main#gallery"
  get "calendar", to: "main#calendar"
  get "contact", to: "main#contact"

  # member and company profiles
  resources :companies, :only => [:index, :show]
  resources :members, :only => [:index, :show]
  
end
