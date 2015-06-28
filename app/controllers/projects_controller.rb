class ProjectsController < ApplicationController
  before_action :signed_in, only: [:new, :edit, :destroy]
  before_action :check_permissions, only: [:edit, :update]

  before_action :get_users, only: [:new, :edit]

  expose(:project, attributes: :project_params)
  expose_decorated(:projects)
  expose(:comments) {project.comments.where.not(id: nil)}
  expose(:tasks, ancestor: :project)

  def index
  end

  def show
  end

  def new
  end

  def create
    if project.save
      Membership.create(project: project, user: current_user, role: Role.find_by(name: 'owner'))
      contributor = Role.find_by(name: 'contributor')
      params[:project][:user_ids].each do |user_id|
        Membership.create(project: project, user_id: user_id, role: contributor)
      end
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

  def project_params
    params.require(:project).permit(:name, :description, :starts_at, :ends_at, {user_ids: []})
  end

  def get_users
    @users = User.where.not(id: current_user.id)
  end

  def check_permissions
    unless project.memberships.exists?(user: current_user, role: Role.find_by(name: 'owner'))
      redirect_to root_path, notice: 'You are not allowed to view this resource'
    end
  end
end