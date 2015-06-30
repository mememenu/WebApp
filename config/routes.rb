Rails.application.routes.draw do
  root 'home#appstore'

  get 'home/index'
  get 'home/about'
  get 'home/contact'
  get 'home/appstore'

  get 'ios/restaurant_info'
  get 'ios/dish_feed'

  get 'ios/paginated_dish_feed'

  get 'ios/miami_restaurants_list'
  get 'ios/nola_restaurants_list'

  get 'ios/menu_info/:id', to: 'ios#menu_info'
  get 'ios/category_info/:id', to: 'ios#category_info'
  get 'ios/dish_info/:id', to: 'ios#dish_info'
  get 'ios/category_info_by_menu/:id', to: 'ios#category_info_by_menu'

  resources :contacts
  resources :images
  resources :categories
  resources :dishes
  resources :menus

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :users
  resources :restaurants, only: [:index, :new, :create]
  resources :restaurants, path: "", except: [:index, :new, :create]
  resources :restaurant_headers
  resources :restaurant_tiles

end
