Rails.application.routes.draw do
  use_doorkeeper
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
  get 'ios/places/nearby', to: 'ios#nearby'
  get 'ios/places/:id', to: 'ios#place_info'

  get "/miamispice" => redirect { |params| "http://www.google.com/maps/d/u/0/viewer?mid=zP-Kc5lMsLps.kIO-I5y-55mM&usp=sharing" }

  namespace :api do
    namespace :v1 do
      resources :topics, only: [] do
        collection do
          get 'trending'
        end
      end
      resources :tracked_events, only: [:create]
      resources :home_pages, only: [:index]
      resources :users do
        get 'list', on: :member
        get 'lists', on: :member
      end
      resources :lists, only: [:index]
      resources :places, only: [:index, :show] do
        put 'add_to_list', on: :member
        collection do
          get 'nearby'
          get 'search'
        end
      end
    end
  end

  resource :tags do
    put 'add_to_place'
    put 'remove_from_place'
  end

  resources :contacts
  resources :images
  resources :categories
  resources :dishes
  resources :menus

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  devise_scope :user do
    post 'api/v1/users/sign_in', to: "devise/sessions#create"
    post 'api/v1/users/sign_up', to: "devise/registrations#create"
    get  'api/v1/users/sign_out', to: "devise/sessions#destroy"
  end

  resources :home_pages, only: [:edit, :update]
  resources :spotlights, only: [:edit, :update]
  resources :users
  resources :places, only: [:index, :new, :create]
  resources :lists
  resources :places, path: "", except: [:index, :new, :create]
  resources :headers
  resources :tiles

end
