# frozen_string_literal: true

Rails.application.routes.draw do
 

  # resources :users, only: [:index, :show] do
  #   resources :posts, only: [:index, :show]
  # end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  
  # get 'post/index'
  # get 'post/show'
  # get 'users/index'
  # get 'users/show'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
