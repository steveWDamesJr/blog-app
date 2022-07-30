# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
 

  # resources :users, only: [:index, :show] do
  #   resources :posts, only: [:index, :show]
  # end

  # resources :users, only: [:index, :show] do
  #   resources :posts, only: [:index, :create, :new, :show, :destroy] do
  #     resources :comments, only: [:index, :create]
  #     resources :likes, only: [:create, :destroy]
  #   end
    resources :users do
      resources :posts do
        resources :comments
        resources :likes
      end
  end
  
  # get 'post/index'
  # get 'post/show'
  # get 'users/index'
  # get 'users/show'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
