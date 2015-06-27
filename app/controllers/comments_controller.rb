class CommentsController < ApplicationController
  expose(:comment, attributes: :comment_params)

  def create
    comment.user = current_user
    if comment.save
      redirect_to get_redirection_path, notice: 'Comment has been added.'
    else
      redirect_to get_redirection_path, notice: 'Something went wrong.'
    end
  end

  def update
    if comment.update(comment_params)
      redirect_to get_redirection_path, notice: 'Comment has been updated.'
    else
      redirect_to get_redirection_path, notice: 'Something went wrong.'
    end
  end

  def destroy
    resourceable = get_redirection_path
    comment.destroy
    redirect_to resourceable, notice: 'Comment has been removed.'
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :task_id, :project_id)
  end

  def get_redirection_path
    if comment.resourceable.instance_of?(Task)
      [comment.resourceable.project, comment.resourceable]
    else
      comment.resourceable
    end
  end
end