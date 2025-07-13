Rails.application.routes.draw do
  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Authentication routes
  post "signup", to: "users#create"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  get "profile", to: "users#profile"

  # API versioning - all versions point to same controller
  get "api/v1/mechs/search", to: "mechs#search", as: :api_v1_mechs_search
  get "api/v2/mechs/search", to: "mechs#search", as: :api_v2_mechs_search

  # Root path
  root "mechs#index"
end
