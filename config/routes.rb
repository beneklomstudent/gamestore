require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
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
  get "/delete", to: "listings#delete"
  # get "/destroy", to: "listings#delete"
  delete 'listings/:id', to: 'listing#destroy'

end