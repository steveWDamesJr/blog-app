class LikesController < ApplicationController
  def create
    @user = Current.user
    @post = Post.includes(:author).find(params[:post_id])

    @already_liked = Like.where(author: @user, post: @post)
    destroy && return if @already_liked.present?

    @like = Like.create(likes_params)
    @like.author = @user
    @like.post = @post

    flash[:notice] = if @like.save
                       'You have successfully liked this post!'
                     else
                       'Sorry, you did not successfully like this post.'
                     end
    redirect_back_or_to user_post_path(@post.author, @post)
  end

  def destroy
    @like = Current.user.likes.last
    @like.destroy
    @post = @like.post
    flash[:notice] = 'You have successfully unliked this post!'
    redirect_back_or_to user_post_path(@post.author, @post)
  end

  private

  def likes_params
    params.permit(:author_id, :id)
  end
end
