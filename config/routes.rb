Rails.application.routes.draw do

  resources :restaurant_headers

  resources :restaurant_tiles

  root 'home#index'

  get 'home/index'
  get 'home/about'
  get 'home/contact'

  get 'ios/restaurant_info'
  get 'ios/dish_feed'
  get 'ios/menu_info/:id', to: 'ios#menu_info'
  get 'ios/category_info/:id', to: 'ios#category_info'
  get 'ios/dish_info/:id', to: 'ios#dish_info'


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
