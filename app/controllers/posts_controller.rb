class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @posts = Post.includes(:author).where(author: params[:user_id])
  end

  def show
    @post = Post.includes(:author).find(params[:id])
    @post = Post.includes(:author, comments: [:author]).find(params[:id]) if @post.comments.any?
  end

  def create
    @user = current_user
    @post = Post.create(post_params)
    @post.author = @user
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      flash[:notice] = 'You have just created a new post!'
      redirect_to user_post_path(@post.author, @post)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @post = Post.new
  end

  def edit; end

  def update; end

  def delete; end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path, notice: 'Your post was deleted successfully'
  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :role)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
