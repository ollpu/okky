Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'index#index'
  
  get '/hallinta/sivut/järjestys' => 'pages#order', as: 'admin_pages_order'
  post '/hallinta/sivut/järjestys' => 'pages#save_order', as: 'admin_pages_save_order'
  resources :pages, path: '/hallinta/sivut'
  resources :posts, path: '/hallinta/päivitykset'
  get '/hallinta' => 'admin#index'
  get '/hallinta/login' => 'admin#login'
  
  get '/päivitykset/*date' => 'posts#show'
  
  # Warning! This assigns a dynamic route to a controller on all paths.
  #          Keep this declaration as low as possible, to avoid blackouts of other static routes.
  get '*text_id' => 'pages#view', as: :navigate
  
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
