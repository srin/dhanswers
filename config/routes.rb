Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  
  match '/', to: 'pages#home', via: 'get'

  get 'pages/about'

  get 'pages/leaderboard'

resources :posts do
  resources :comments do
    member do
      put "like", to: "comments#upvote"
      put "dislike", to: "comments#downvote"
    end
  end
end

  root 'pages#home'
end 


