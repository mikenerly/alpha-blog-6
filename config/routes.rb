Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'pages#home'
    get 'about', to: 'pages#about'
    #to get all the route for acticles
    #resources :articles, only: [ :show, :index, :new, :create, :edit, :update ]
    resources :articles
    #adding signup routes to the app
    get 'signup', to: 'users#new'
    #post 'users', to: 'users#create' #one route
    resources :users, except: [:new]
    #add route for login page
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
    #add ressource for categories controller
    resources :categories, except: [:destroy]
end
