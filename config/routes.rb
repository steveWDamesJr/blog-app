# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
 

  # resources :users, only: [:index, :show] do
  #   resources :posts, only: [:index, :show]
  # end

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :create, :new, :show] do
      resources :comments, only: [:index, :create]
      resources :likes, only: [:create, :destroy]
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

# user = User.create(name: "raj",email:"raj@gmail.com",password: "foobar")
# user = User.create(name: 'Clancy', photo: 'https://bit.ly/3O49ZQM', bio: 'Teacher from Mexico.', po
#   sts_counter: 0, email:"clancy@gmail.com", password: "foobar")
