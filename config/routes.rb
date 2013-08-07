KneeScum::Application.routes.draw do
  resources :routes

  root 'routes#index'
end
