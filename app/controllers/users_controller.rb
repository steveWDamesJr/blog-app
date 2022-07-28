class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.recent_posts.includes(:author)
  end

  def new; end

  def create; end

  def edit; end

  def update; end

  def delete; end

  def destroy; end
end
