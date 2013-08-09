KneeScum::Application.routes.draw do
  resources :climbs do
    resources :photos
  end

  root 'application#main'
end
