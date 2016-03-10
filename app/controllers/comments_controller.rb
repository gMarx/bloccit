class CommentsController < ApplicationController

  before_action :require_sign_in
  before_action :authorize_user, only: [:destroy]

  def create
    if params[:post_id]
      commentable = Post.find(params[:post_id])
    elsif params[:topic_id]
      commentable = Topic.find(params[:topic_id])
    end
    comment = commentable.comments.new(comment_params)
    comment.user = current_user

    if comment.save
      flash[:notice] = 'Comment saved successfully'
      redirect_to :back
    else
      flash[:alert] = 'Comment failed to save, please try again.'
      redirect_to :back
    end
  end

  def destroy
    if params[:post_id]
      comment = Comment.find(params[:id])
    elsif params[:topic_id]
      comment = Comment.find(params[:id])
    end

    comment.user = current_user

    if comment.destroy
      flash[:notice] = 'Comment deleted'
      redirect_to :back
    else
      flash[:alert] = 'Comment could not be deleted. Please try again'
      redirect_to :back
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def authorize_user
    comment = Comment.find(params[:id])
    unless current_user == comment.user || current_user.admin?
      flash[:alert] = 'You do not have permission to delete a comment'
      redirect_to [comment.post.topic, comment.post]
    end
  end
end
