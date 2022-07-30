class CommentsController < ApplicationController
 

  def create
    @comment = Comment.create(comment_params)
    @comment.author = current_user
    post = Post.find(params[:post_id])
    @comment.post = post
    if @comment.save
      
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
