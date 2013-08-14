KneeScum::Application.routes.draw do
  resources :areas

  resources :climbs do
    resources :photos
  end

  root 'application#main'
end
