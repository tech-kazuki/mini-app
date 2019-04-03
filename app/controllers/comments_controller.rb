class CommentsController < ApplicationController
  def create
    Comment.create(comment: comment_params[:comment], user_id: current_user.id, content_id: comment_params[:content_id])
    redirect_to content_path(params[:content_id])
  end

  private
  def comment_params
    params.permit(:comment, :content_id)
  end
end
