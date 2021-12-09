require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  resources :listings
  resources :listings
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => "/sideqik"
    end
    
  root to: 'listings#index'
  get "/index", to: "listings#index"
  get "/new", to: "listings#new"
  get "/edit", to: "listings#edit"
  get "/show", to: "listings#show"
  get "/test", to: "listings#test"
  get "/checkout", to: 'listings#checkout'
  get "/deletelisting", to: "listing#destroy"
#  do
#     delete :destroy, path: 'Delete_listing', as: "destroy"
  end
  
