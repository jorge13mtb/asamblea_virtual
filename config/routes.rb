AsambleaVirtual::Application.routes.draw do
  get "asamblea/new"
  root  'sesiones#new' 

  resources :diputados, only: [:show]
  resources :sesiones, only: [:new, :create, :destroy]


  match '/api/asamblea/diputados',           to: 'api/asamblea#diputados',           via: 'get'
  match '/api/asamblea/crear_usuario',       to: 'api/asamblea#crear_usuario',       via: 'get'
  match '/api/asamblea/log_in',              to: 'api/asamblea#log_in',              via: 'get'
  match '/api/asamblea/nueva_pregunta',      to: 'api/asamblea#nueva_pregunta',      via: 'get'
  match '/api/asamblea/preguntas',           to: 'api/asamblea#preguntas',           via: 'get'
  match '/api/asamblea/preguntas_diputado',  to: 'api/asamblea#preguntas_diputado',  via: 'get'
 
  match '/api/asamblea/diputados_por_provincia',    to: 'api/asamblea#diputados_por_provincia',     via: 'get'
  match '/api/asamblea/diputados_por_partido',      to: 'api/asamblea#diputados_por_partido',       via: 'get'
  match '/api/asamblea/busqueda_diputados_nombre',  to: 'api/asamblea#busqueda_diputados_nombre',   via: 'get'
  
  match '/responder', to: 'diputados#responder', via: 'post'

  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/signout', to: 'sesiones#destroy',     via: 'delete'

end
