class ProjectsController < ApplicationController
  before_action :find_project, only: [ :show, :edit, :update ]

  def index
    @projects = Project.all
  end

  def show
    render :show, locals: { project: @project }
  end

  def edit
    render :edit, locals: { project: @project }
  end

  def update
    if @project.update(update_params)
      render :show, locals: { project: @project }
    else
      render :edit, locals: { project: @project }
    end
  end

  private

  def find_project
    @project = Project.find(params[:id])
  end

  def update_params
    params.require(:project).permit(:name)
  end
end
