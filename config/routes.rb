Rails.application.routes.draw do
  post 'messages/create' => 'messages#create'

  get 'messages/view' => 'messages#view'

  get 'messages/:id/new' => 'messages#new'

  delete 'messages/delete' => 'messages#delete'

  post 'bulletins/create' => 'bulletins#create'

  delete 'bulletins/:id/delete' => 'bulletins#delete'

  post 'games/create' => 'games#create'

  patch 'games/:id/update' => 'games#update'

  get 'games/newgame' => 'games#newgame'

  get 'games/:id/edit' => 'games#edit'

  get 'games/:id/view' => 'games#view'

  delete 'games/:id/delete' => 'games#delete'

  post 'teams/create' => 'teams#create'

  get 'teams/new' => 'teams#new'

  patch 'teams/:id/update' => 'teams#update'

  get 'teams/:id/edit' => 'teams#edit'

  get 'teams/:id/view' => 'teams#view'

  get 'players/new' => 'players#new'

  post 'players/create' => 'players#create'

  get 'players/:id/edit' => 'players#edit'

  patch 'players/:id/update' => 'players#update'

  delete 'players/:id/delete' => 'players#delete'

  get 'players/:id/view' => 'players#view'

  get 'users/index' => 'users#index'

  root 'users#index'

  get 'users/dashboard' => 'users#dashboard'

  post 'users/create' => 'users#create'

  get 'users/edit' => 'users#edit'

  patch 'users/update' => 'users#update'

  post 'users/login' => 'users#login'

  get 'users/logout' => 'users#logout'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
