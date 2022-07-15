class PostsController < ApplicationController
  def index
    @posts = Post.includes(:author).where(author: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new; end

  def create; end

  def edit; end
  # debugger
  def update; end

  def delete; end

  def destroy; end
end
