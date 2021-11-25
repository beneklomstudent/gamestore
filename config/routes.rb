Rails.application.routes.draw do
  resources :posts
  resources :genres
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "welcome#index" 
  get "/index", to: "welcome#index"
  get "/test", to: "welcome#test"
end
