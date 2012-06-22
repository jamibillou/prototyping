BootstrapPrototyping::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.
  
  match 'candidate_profile_public'    => 'shareable#candidate_profile_public'
  match 'recruiter_starts_discussion' => 'shareable#recruiter_starts_discussion'
  match 'recruiter_isnt_interested'   => 'shareable#recruiter_isnt_interested'
  match 'candidate_profile_sent'      => 'shareable#candidate_profile_sent'
  match 'recruiter_answers_yes'       => 'shareable#recruiter_answers_yes'
  match 'recruiter_answers_no'        => 'shareable#recruiter_answers_no'
  match 'candidate_conversations'     => 'shareable#candidate_conversations'
  match 'candidate_conversations2'    => 'shareable#candidate_conversations2'
  match 'candidate_conversations3'    => 'shareable#candidate_conversations3'
  match 'candidate_conversations4'    => 'shareable#candidate_conversations4'
  match 'candidate_sharings'          => 'shareable#candidate_sharings'
  match 'candidate_sharings2'         => 'shareable#candidate_sharings2'
  match 'candidate_sharings3'         => 'shareable#candidate_sharings3'
  match 'recruiter_profile'           => 'shareable#recruiter_profile'
  match 'candidate_matches'           => 'shareable#candidate_matches'
  match 'candidate_matches2'          => 'shareable#candidate_matches2'
  match 'candidate_matches3'          => 'shareable#candidate_matches3'
  match 'recruiter_conversations'     => 'shareable#recruiter_conversations'
  match 'recruiter_conversations2'    => 'shareable#recruiter_conversations2'
  match 'recruiter_conversations3'    => 'shareable#recruiter_conversations3'
  match 'recruiter_conversations4'    => 'shareable#recruiter_conversations4'
  match 'recruiter_sharings'          => 'shareable#recruiter_sharings'
  match 'recruiter_sharings2'         => 'shareable#recruiter_sharings2'
  match 'recruiter_sharings3'         => 'shareable#recruiter_sharings3'

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
