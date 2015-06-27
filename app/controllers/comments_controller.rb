class CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment.resourceable, notice: 'Comment has been added.'
    else
      redirect_to @comment.resourceable, notice: 'Something went wrong.'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment.resourceable, notice: 'Comment has been updated.'
    else
      redirect_to @comment.resourceable, notice: 'Something went wrong.'
    end
  end

  def destroy
    resourceable = @comment.resourceable
    @comment.destroy
    redirect_to resourceable, notice: 'Comment has been removed.'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :task_id, :project_id)
  end
end