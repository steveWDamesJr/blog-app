class CommentsController < ApplicationController
  def index
    post = Post.find(params[:post_id])
    render json: post.comments
  end

  def create
    @comment = Comment.create(comment_params)
    @comment.author = current_user
    post = Post.find(params[:post_id])
    @comment.post = post
    if @comment.save
       respond_to do |format|
        format.html do
          flash[:notice] = 'Comment was successfully created'
          redirect_to user_post_path(post.author, post)
        end
        format.json do
          render json: @comment
        end
      end 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.post = @post
    @comment.destroy
    redirect_to user_post_path(current_user, params[:post_id]), notice: 'Successfully deleted the comment.'
  end

  private

  def comment_params
    params.permit(:text)
  end
end
