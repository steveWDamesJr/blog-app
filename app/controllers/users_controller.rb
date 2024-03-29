class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role)
  end

  def index
    @users = User.all
    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
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
