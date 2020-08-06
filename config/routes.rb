Rails.application.routes.draw do
  root "posts#index"

  resources :posts do
    resources :likes
    resources :comments
  end

  get "posts/filter/:filter" => "posts#index", as: "filtered_posts"

  resources :users

  get "users/:id/filter/:filter" => "users#show", as: "filtered_user_posts"

  resource :session, only: [:new, :create, :destroy]

  get "signup" => "users#new"
  get "signin" => "sessions#new"

end
