LibraryRoomReservation::Application.routes.draw do

  resources :reservations

  resources :rooms

  resources :users


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  get  '/signup',  to: 'users#new_user'
  post  '/signup',  to: 'users#create_user'
  get '/new_admin', to: 'users#new_admin'
  post  '/new_admin',  to: 'users#create_admin'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'

  get '/profile/:id', to: 'users#edit_profile'
  patch '/profile/:id', to: 'users#update_profile'

  get 'user/home'  => 'reservations#home'
  get 'user/all_rooms' => 'users#all_rooms'
  get 'user/search_room_form' => 'users#search_room_form'
  get 'user/my_reservations' => 'users#my_reservations'
  get 'admin/manage_reservations' => 'reservations#index'
  get 'user/rooms/:id' => 'rooms#show_user'
  get 'admin/home'  => 'admins#home'
  get '/search'  => 'reservations#search'
  get '/search_for_user' => 'reservations#search_user'

  post '/reserve' => 'reservations#create'

  #get '/reserve' => 'reservations#reserve'
  get 'reservation/release/:id' => 'reservations#release'
  get 'admin/reserve_room_for_user' => 'admins#reserve_room_for_user'

  get 'rooms/destroy/:id' => 'rooms#destroy'
  get 'users/destroy/:id' => 'users#destroy'


  #get 'admin/reserve_room_for_user' => 'admin/reserve_room_for_user'
  #root 'reservations#new'
  root 'sessions#new'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
