Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get '/artworks', to: 'artworks#index' 
  get '/artworks/:id', to: 'artworks#show'

  get "/artists/:artist_id/artworks", to: "artist_artworks#index"
  
  get '/artists', to: 'artists#index'
  get '/artists/:id', to: 'artists#show'


end
