Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # THE ROOT ROUTE
  root 'posts#index', as: 'home'

  #regular route
  get 'about' => 'pages#about', as: 'about'

  #For making multiple routes like show,new,post,destroy...claim Post controller a RESOURCE. Use rake routes to see all the routes
  resources :posts do
    resources :comments
  end
end
