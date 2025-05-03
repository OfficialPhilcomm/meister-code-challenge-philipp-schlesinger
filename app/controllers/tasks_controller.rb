class TasksController < ApplicationController
  before_action :find_project, only: [ :index, :show, :edit, :update, :destroy ]
  before_action :find_task, only: [ :show, :edit, :update, :destroy ]

  def index
    @tasks = @project.tasks.not_deleted.not_expired
  end

  def show
    render :show, locals: { project: @project, task: @task }
  end

  def edit
    render :edit, locals: { project: @project, task: @task }
  end

  def update
    if @task.update(update_params)
      render :show, locals: { project: @project, task: @task }
    else
      render :edit, locals: { project: @project, task: @task }
    end
  end

  def destroy
    if @task.update(deleted_at: Time.zone.now)
      render turbo_stream: turbo_stream.remove(@task)
    end
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end

  def find_task
    @task = Task.find(params[:id])
  end

  def update_params
    params.require(:task).permit(:name)
  end
end
