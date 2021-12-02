require 'sidekiq/web'

Rails.application.routes.draw do
  devise_for :users
  authenticate :user, lambda { |u| u.admin? } do
  mount Sidekiq::Web => "/sideqik"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "welcome#index" 
  get "/index", to: "welcome#index"
  get "/test", to: "welcome#test"
  get "/new", to: "welcome#new"
  get "/game", to: "welcome#game"
  post "/game", to: "games#create"

end
