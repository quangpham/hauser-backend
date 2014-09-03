HousingApi::Application.routes.draw do
  # devise_for :users

  devise_for :users, :skip => [:sessions]
  as :user do
    get    '/api/v1/user/houses'                  => 'sessions#my_houses'
    get    '/api/v1/user/basic_info'              => 'sessions#basic_info'
    get    '/api/v1/user/houses_info'             => 'sessions#houses_info'
    post   '/api/v1/user/request'                 => 'sessions#login_request'
    post   '/api/v1/user/login'                   => 'sessions#login'
    post   '/api/v1/user/logout'                  => 'sessions#destroy'
    post   '/api/v1/user/update_user_info'        => 'sessions#update_user_info'
    post   '/api/v1/user/update_basic_user_info'  => 'sessions#update_basic_user_info'
    post   '/api/v1/user/update_house_info'       => 'sessions#update_house_info'
  end
  
  namespace :api, defaults: {format: "json"} do
    namespace :v1 do
      
      resources :posts
      
      resources :houses, only: [:index, :show] do
        member do
          post :add_user,     :action => 'add_user'
          post :remove_user,  :action => 'remove_user'
          get  :facilities,   :action => 'get_facilities'
        end

        resources :pins, only: [:index, :create]
      end  
      
      resources :facilities, only: [:index, :show] do
        # http://localhost:3000/api/v1/facilities/1/bookings
        resources :user_facility_bookings, :path => "bookings", only: [:create]
      end

      resources :user_facility_bookings, :path => "bookings", only: [:index]
    end
  end
  
end
