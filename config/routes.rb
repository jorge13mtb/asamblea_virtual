AsambleaVirtual::Application.routes.draw do
  get "asamblea/new"
  root  'sesiones#new' 

  resources :diputados, only: [:show]
  resources :sesiones, only: [:new, :create, :destroy]


  match '/api/asamblea/diputados',       to: 'api/asamblea#diputados',         via: 'get'
  match '/api/asamblea/crear_usuario',   to: 'api/asamblea#crear_usuario',     via: 'get'
  match '/api/asamblea/log_in',          to: 'api/asamblea#log_in',            via: 'get'
  match '/api/asamblea/nueva_pregunta',  to: 'api/asamblea#nueva_pregunta',    via: 'get'
  match '/api/asamblea/preguntas',       to: 'api/asamblea#preguntas',         via: 'get'
  
  match '/responder', to: 'diputados#responder', via: 'post'


  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/signout', to: 'sesiones#destroy',     via: 'delete'


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
