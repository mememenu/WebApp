Rails.application.routes.draw do
  root 'home#appstore'

  get 'home/index'
  get 'home/about'
  get 'home/contact'
  get 'home/appstore'

  get 'ios/restaurant_info', to: 'ios#place_info'
  get 'ios/dish_feed'
  get 'ios/paginated_dish_feed'
  get 'ios/miami_restaurants_list', to: 'ios#miami_places_list'
  get 'ios/menu_info/:id', to: 'ios#menu_info'
  get 'ios/category_info/:id', to: 'ios#category_info'
  get 'ios/dish_info/:id', to: 'ios#dish_info'
  get 'ios/category_info_by_menu/:id', to: 'ios#category_info_by_menu'

  get "/miamispice" => redirect { |params| "http://www.google.com/maps/d/u/0/viewer?mid=zP-Kc5lMsLps.kIO-I5y-55mM&usp=sharing" }

  namespace :api do
    namespace :v1 do
      resources :spotlights, only: [:index]
      resources :users do
        get 'list', on: :member
      end
      resources :lists, only: [:index] do
        collection do
          get 'featured'
        end
      end
      resources :places, only: [] do
        collection do
          get 'nearby'
        end
      end
    end
  end

  resources :contacts
  resources :images
  resources :categories
  resources :dishes
  resources :menus

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :users
  resources :places, only: [:index, :new, :create]
  resources :places, path: "", except: [:index, :new, :create]
  resources :headers
  resources :tiles

end
