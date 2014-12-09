Rails.application.routes.draw do

  root 'home#index'

  get 'home/index'
  get 'home/about'
  get 'home/contact'

  get 'restaurants/ios'

  resources :contacts

  resources :ingredients

  resources :images

  resources :categories

  resources :dishes

  resources :menus

  resources :restaurant_cuisines

  resources :cuisines

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :users
  
  resources :restaurants, only: [:index, :new, :create]
  resources :restaurants, path: "", except: [:index, :new, :create]

end
