Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  resources :reviews
  root "recipes#index"
end
