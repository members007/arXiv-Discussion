Rails.application.routes.draw do
  root 'home#about'
  get 'replies/index'
  get 'replies/:post_id/new' => "replies#new"
  post 'replies/:post_id/create' => "replies#create"
  post 'likes/:post_id/create' => "likes#create"
  post 'likes/:post_id/destroy' => "likes#destroy"
  get 'login' => "users#login_form"
  post 'login' => "users#login"
  post 'logout' => "users#logout"
  get 'users/:id/edit' => "users#edit"
  get 'signup' => "users#new"
  post 'users/create' => "users#create"
  get 'users/index' => "users#index"
  get 'users/:id' => "users#show"
  post 'users/:id/update' => "users#update"
  get 'posts/index' => "posts#index"
  get 'posts/new' => "posts#new"
  post 'posts/search' => "posts#search"
  get 'posts/:id' => "posts#show"
  get 'posts/:id/edit' => "posts#edit"
  post 'posts/create' => "posts#create"
  post 'posts/:id/update' => "posts#update"
  post 'posts/:id/destroy' => "posts#destroy"
  get '/' => "home#top"
  get 'about' => "home#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
