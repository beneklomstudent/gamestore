require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  resources :listings
  resources :orders

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
  get 'carts/:id', to: "carts#show", as: "cart"
  delete 'carts/:id', to: "carts#destroy"
  post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
  post 'line_items', to: "line_items#create"
  get 'line_items/:id', to: "line_items#show", as: "line_item"
  delete 'line_items/:id', to: "line_items#destroy"

 

end
  
