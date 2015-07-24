Rails.application.routes.draw do

  

  devise_for :users, controllers: { 
    sessions: "users/sessions" 
  }

  resources :users do 
    resources :readings 
    resources :systolic_ranges
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'readings#index'


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

#   Prefix Verb   URI Pattern                                        Controller#Action
#         new_user_session GET    /users/sign_in(.:format)                           users/sessions#new
#             user_session POST   /users/sign_in(.:format)                           users/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                          users/sessions#destroy
#            user_password POST   /users/password(.:format)                          devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)                      devise/passwords#new
#       edit_user_password GET    /users/password/edit(.:format)                     devise/passwords#edit
#                          PATCH  /users/password(.:format)                          devise/passwords#update
#                          PUT    /users/password(.:format)                          devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                            devise/registrations#cancel
#        user_registration POST   /users(.:format)                                   devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                           devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                              devise/registrations#edit
#                          PATCH  /users(.:format)                                   devise/registrations#update
#                          PUT    /users(.:format)                                   devise/registrations#update
#                          DELETE /users(.:format)                                   devise/registrations#destroy
#            user_readings GET    /users/:user_id/readings(.:format)                 readings#index
#                          POST   /users/:user_id/readings(.:format)                 readings#create
#         new_user_reading GET    /users/:user_id/readings/new(.:format)             readings#new
#        edit_user_reading GET    /users/:user_id/readings/:id/edit(.:format)        readings#edit
#             user_reading GET    /users/:user_id/readings/:id(.:format)             readings#show
#                          PATCH  /users/:user_id/readings/:id(.:format)             readings#update
#                          PUT    /users/:user_id/readings/:id(.:format)             readings#update
#                          DELETE /users/:user_id/readings/:id(.:format)             readings#destroy
#     user_systolic_ranges GET    /users/:user_id/systolic_ranges(.:format)          systolic_ranges#index
#                          POST   /users/:user_id/systolic_ranges(.:format)          systolic_ranges#create
#  new_user_systolic_range GET    /users/:user_id/systolic_ranges/new(.:format)      systolic_ranges#new
# edit_user_systolic_range GET    /users/:user_id/systolic_ranges/:id/edit(.:format) systolic_ranges#edit
#      user_systolic_range GET    /users/:user_id/systolic_ranges/:id(.:format)      systolic_ranges#show
#                          PATCH  /users/:user_id/systolic_ranges/:id(.:format)      systolic_ranges#update
#                          PUT    /users/:user_id/systolic_ranges/:id(.:format)      systolic_ranges#update
#                          DELETE /users/:user_id/systolic_ranges/:id(.:format)      systolic_ranges#destroy
#                    users GET    /users(.:format)                                   users#index
#                          POST   /users(.:format)                                   users#create
#                 new_user GET    /users/new(.:format)                               users#new
#                edit_user GET    /users/:id/edit(.:format)                          users#edit
#                     user GET    /users/:id(.:format)                               users#show
#                          PATCH  /users/:id(.:format)                               users#update
#                          PUT    /users/:id(.:format)                               users#update
#                          DELETE /users/:id(.:format)                               users#destroy
#                     root GET    /                                                  readings#index

