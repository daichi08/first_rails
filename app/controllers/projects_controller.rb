class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects.order(params[:sort])
    @projects.each do |project|
      if project.tasks.count.to_f == 0
        project.progress = -1
        project.save
      else
        project.progress = project.tasks.finished.count.to_f / project.tasks.count.to_f * 100
        project.save
      end
    end
  end

  def new
    @project = Project.new
  end

  def show
    @tasks = @project.tasks.order(params[:sort])
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to projects_path
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
      params[:project].permit(:title,:user_id)
  end

  def set_project
    @project = current_user.projects.find(params[:id])
  end

end