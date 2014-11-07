class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.commentable_type = "PublicActivity::ORM::ActiveRecord::Activity"
    @comment.save
  end

  def destroy
    @comment = Challenge.find(params[:id]).destroy
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment, :commentable_id)
    end

end