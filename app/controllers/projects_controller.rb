class ProjectsController < ApplicationController
  expose(:project)

  def index
    @projects = Project.all
  end

  def show
    @comments = Comment.where(project_id: project.id)
  end

  def new
  end

  def create
    if project.save
      redirect_to projects_path, notice: 'Project has been added.'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if project.update(project_params)
      redirect_to projects_path, notice: 'Project has been updated.'
    else
      render 'edit'
    end
  end

  def destroy
    project.destroy
    redirect_to projects_path, notice: 'Project has been removed.'
  end

  private

  def signed_in
    flash[:danger] = 'You have no permission.'
    redirect_to new_user_session_path unless user_signed_in?
  end

  def project_params
    params.require(:project).permit(:name, :description, :starts_at, :ends_at)
  end
end