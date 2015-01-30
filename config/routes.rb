Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  
  
  get 'pages/home'

  get 'pages/about'

resources :posts do
  resources :comments do
    member do
      put "like", to: "comments#upvote"
      put "dislike", to: "comments#downvote"
    end
  end
end

  root 'posts#index'
end 