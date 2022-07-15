class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.recent_posts
  end

  def new; end

  def create; end

  def edit; end

  def update; end

  def delete; end

  def destroy; end
end
