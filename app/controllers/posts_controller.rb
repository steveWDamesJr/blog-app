class PostsController < ApplicationController
  def index
    @posts = Post.includes(:author).where(author: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.create(post_params)
    @post.author = Current.user
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

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def edit; end

  def update; end

  def delete; end

  def destroy; end
end
