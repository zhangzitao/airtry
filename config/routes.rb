Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'

  devise_for  :users,
              path: '',
              path_names: {sign_in: 'login', 
                          sign_out: 'logout', 
                          edit: 'profile', 
                          sign_up: 'registration'}

  resources :users, only: [:show]
  resources :rooms, except: [:edit] do
    member do 
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'location'
      get 'preload'
      get 'preview'
    end
    resources :roomphotos, only: [:create, :destroy]
    resources :reservations, only:[:create]
  end

  get '/mytrips' => 'reservations#mytrips'
  get '/myreservations' => 'reservations#myreservations'

end
