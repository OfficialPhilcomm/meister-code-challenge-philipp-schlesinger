class ProjectsController < ApplicationController
  before_action :find_project, only: [ :show, :edit, :update, :destroy ]

  def index
    @projects = Project.not_deleted
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

  def destroy
    if @project.update(deleted_at: Time.zone.now)
      render turbo_stream: turbo_stream.remove(@project)
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
