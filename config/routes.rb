require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  resources :listings
  resources :orders
  get '/line_items/:id', to: 'line_items#create', as: :Listing
  resources :line_items
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
  get "/search", to: "listings#search"   
  # get 'carts/:id', to: "carts#show", as: "cart"
  get 'cart/', to: "carts#show"
  delete 'carts/:id', to: "carts#destroy"
  get '/order/', to: 'orders#show'
  
  # post 'listings/:listing_id', to: "listings#create"
  # post 'line_items/:id/add', to: "line_items#add_quantity", as: "line_item_add"
  # post 'line_items/:id/reduce', to: "line_items#reduce_quantity", as: "line_item_reduce"
  # get 'line_items/', to: "line_items#create"
  # get 'line_items/:id', to: "line_items#show", as: "line_item"
  # post 'line_items/:id', to: "line_items#create", as: "line_item"
  # get "line_items/, to: "line_items#create"
  # delete 'line_items/:id', to: "line_items#destroy"
#   post '/line_item/', to: "line_items#create"
#  get 'listings/:id', to: "line_items#create", as: ""



end
  
