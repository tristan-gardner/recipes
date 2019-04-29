Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  resources :reviews
  resources :users
  root "recipes#index"

  post '/recipes/:id/upvote', to: 'up_down_votes#upvote', as: :upvote
  post '/recipes/:id/downvote', to: 'up_down_votes#downvote', as: :downvote
  post '/recipes/:id/add_review', to:'reviews#add_review', as: :add_review
end
