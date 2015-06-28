class TasksController < ApplicationController
  before_action :check_permissions

  expose_decorated(:task, attributes: :task_params)
  expose(:project)
  expose(:comment) {Comment.new}
  expose(:comments)
  expose(:tasks) { project.tasks }

  # GET /tasks
  def index
  end

  # GET /tasks/1
  def show
    @comments = Comment.where(task_id: task.id)
  end

  # GET /tasks/new
  def new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    task.project = project
    if task.save
      redirect_to project_task_path(project,task), notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if task.update(task_params)
      redirect_to project_task_path(project,task), notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    task.destroy
    redirect_to project_tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :description, :deadline, :priority_id, :status_id, :user_id)
    end

    def check_permissions
      unless project.memberships.exists?(user: current_user)
        redirect_to root_path, notice: 'You are not allowed to view this resource'
      end
    end
end
