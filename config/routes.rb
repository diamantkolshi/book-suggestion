Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'homepages#index'

  resources :items, only: [:new, :create]
  get 'items/uploads', to: "items#uploads"
  get 'items/uploads', to: "items#uploads"
  get 'items/choose_form', to: "items#choose_form"
  get 'items/give_books', to: "items#give_books"
  get 'items/sell_books', to: "items#sell_books"
  post 'upload_image', to: "items#upload_image"  
  delete 'delete_image', to: "items#delete_image"
  get 'complete_register', to: "items#complete_register"

  resources :ks_platform, only: [:index, :show]
  resources :al_platform, only: [:index, :show]
  get "ks_platform_category", to: "ks_platform#category"
  get "al_platform_category", to: "al_platform#category"
  
  get "intrudaction", to: "items#intrudaction"
  get "ks_platform_search", to: "ks_platform#search"
  get "al_platform_search", to: "al_platform#search"
  
  get "contact", to: "contact#index"


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
