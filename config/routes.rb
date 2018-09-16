Rails.application.routes.draw do
  
  get 'guests/form'
  get "/" => "home#top"
  
  get "posts/index" => "posts#index"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  
  get "users/index" => "users#index"
  get "users/new" => "users#new"
  post "users/create" => "users#create"
  get "users/:id" => "users#show"
  get "users/:id/edit" => "users#edit"
  post "users/:id/update" => "users#update"
  post "users/:id/destroy" => "users#destroy"
  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"
  
  post "likes/:id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  
  get "carts/:id" => "carts#show"
  post "carts/add_item" => "carts#add_item",as:'carts_add_item'
  post "carts/:id/destroy" => "carts#destroy"
  
  get "guests/form" => "guests#form"
  post "guests/info" => "guests#info"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end