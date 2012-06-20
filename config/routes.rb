BootstrapPrototyping::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.
  
  match 'candidate_profile_public' => 'shareable#candidate_profile_public'
  match 'candidate_profile_sent' => 'shareable#candidate_profile_sent'
  match 'candidate_interactions' => 'shareable#candidate_interactions'
  match 'recruiter_answers_yes' => 'shareable#recruiter_answers_yes'
  match 'recruiter_answers_no' => 'shareable#recruiter_answers_no'
  match 'recruiter_profile' => 'shareable#recruiter_profile'
  match 'candidate_matches' => 'shareable#candidate_matches'
  match 'candidate_matches_because' => 'shareable#candidate_matches_because'

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
