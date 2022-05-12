Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    root 'pages#home'
    get 'about', to: 'pages#about'
    #to get all the route for acticles
    #resources :articles, only: [ :show, :index, :new, :create, :edit, :update ]
    resources :articles
end
