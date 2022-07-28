class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def index
    @users = User.all
  end

  def show
    @user = current_user
    @posts = @user.recent_posts.includes(:author)
  end

  def new; end

  def create; end

  def edit; end

  def update; end

  def delete; end

  def destroy; end
end
