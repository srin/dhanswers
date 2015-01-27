Rails.application.routes.draw do
  devise_for :users
  


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

  

  root 'pages#home'
end 