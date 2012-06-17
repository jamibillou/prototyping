BootstrapPrototyping::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.
  
  match '/dashboard' => 'pages#dashboard'
  match '/prototypes' => 'pages#prototypes'
  match '/social_1' => 'pages#social_1'
  match '/social_2' => 'pages#social_2'
  match '/social_3' => 'pages#social_3'
  match '/social_4' => 'pages#social_4'
  match '/social_5' => 'pages#social_5'
  match '/social_6' => 'pages#social_6'
  match '/shareable_1' => 'pages#shareable_1'
  match '/shareable_2' => 'pages#shareable_2'
  match '/shareable_3' => 'pages#shareable_3'
  match '/shareable_4' => 'pages#shareable_4'
  match '/interviews' => 'pages#interviews'

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'pages#dashboard'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
