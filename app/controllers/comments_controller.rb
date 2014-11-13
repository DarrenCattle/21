class CommentsController < ApplicationController

    before_action :set_comment, only: [:edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.commentable_type = "PublicActivity::ORM::ActiveRecord::Activity"
    @comment.save
    @activity = @comment.activity
  end

  def edit
    @activity = @comment.activity
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to root_path, notice: "Comment updated successfully" }
        format.js
      else
        format.html { redirect_to root_path, error: "Bad times. Comment lost in cyberspace" }
        format.js
      end
    end
  end

  def destroy
    @activity = @comment.activity
    
    respond_to do |format|
      if @comment.destroy
        format.html { redirect_to root_path, notice: "Comment deleted successfully" }
        format.js
      else
        format.html { redirect_to root_path, error: "Bad times. Comment survived." }
        format.js
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment, :commentable_id)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

end