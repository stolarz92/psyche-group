class Api::TaskCommentsController < ApplicationController
  respond_to :json
  layout nil

  def create
    comment = Comment.new(comment_params)
    comment.user = current_user
    if comment.save
      render json: response_data(comment), status: :ok
    else
      render json: 'error'
    end
    # comment = Comment
  end

  def update
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content, :task_id, :project_id)
  end

  def response_data(comment)
    {
      comment: comment,
      user_mail: comment.user.email
    }
  end

end