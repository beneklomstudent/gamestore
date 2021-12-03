require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  resources :listings
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => "/sideqik"
    end
    
  root to: 'listings#index'
  get "/game", to: "welcome#game"
  get "/index", to: "welcome#index"
  get "/new", to: "welcome#new"
  get "/game", to: "welcome#game"
  get "/edit", to: "welcome#edit"
  post "/game", to: "games#create"
  get "/listingindex", to: "listings#index"
  # post "/listing", to: "listings#create"






end