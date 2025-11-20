Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

    get    '/movies',          to: 'movies#index'
    get    '/movies/new',      to: 'movies#new'
    post   '/movies',          to: 'movies#create'
    get    '/movies/:id',      to: 'movies#show'
    get    '/movies/:id/edit', to: 'movies#edit'
    patch  '/movies/:id',      to: 'movies#update'
    delete '/movies/:id',      to: 'movies#destroy'


    resources :lists, only: [:index, :show, :new, :create] do
      resources :bookmarks, only: [:new, :create]
    end
end
