require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  resources :listings
  resources :orders
  post 'line_items/:id/create' => "line_items#create", as: "line_item_create"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => "/sideqik"
    end

# root to: 'devise/sessions#new'
  root to: 'listings#index'
  get "/index", to: "listings#index"
  get "/new", to: "listings#new"
  get "/edit", to: "listings#edit"
  get "/show", to: "listings#show"
  get "/test", to: "listings#test"
  get "/checkout", to: 'listings#checkout'
  get "/search", to: "listings#search"   
  get '/cart/', to: "carts#show"
  get 'empty_cart', to: "carts#destroy"
  


end
  
