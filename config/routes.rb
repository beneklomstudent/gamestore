require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  resources :listings
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => "/sideqik"
    end
    
  root to: 'listings#index'
  get "/game", to: "welcome#game"
  get "/index", to: "listings#index"
  get "/new", to: "listings#new"
  get "/game", to: "welcome#game"
  get "/edit", to: "listings#edit"
  post "/game", to: "games#create"
  get "/show", to: "listings#show"
  get "/test", to: "listings#test"
  

end