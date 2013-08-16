KneeScum::Application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :areas do
        resources :climbs do
          resources :photos
        end
      end
    end
  end

  root 'application#main'
  get  '*url', :to => 'application#main'
end
