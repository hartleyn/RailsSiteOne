Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'posts#index', as: 'home'

  get '/about' => 'pages#about', as: 'about'
  # Admin page
  get '/admin' => 'pages#admin', as: 'admin_page'

  get '/posts/new' => 'posts#new', as: 'new'

  get '/posts/:id/edit' => 'posts#edit', as: 'edit'

  resources :posts

  get '/signup' => 'users#new', as: 'new_user'

  put '/users/:id' => 'users#update', as: 'update_user'

  resources :users

  get '/login' => 'sessions#new', as: 'new_session'

  post '/login' => 'sessions#create', as: 'create_session'

  delete '/logout' => 'sessions#destroy', as: 'logout'
end
