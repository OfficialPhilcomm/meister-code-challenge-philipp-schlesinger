class TasksController < ApplicationController
  before_action :find_project, only: [ :index, :show, :edit, :update ]
  before_action :find_task, only: [ :show, :edit, :update ]

  def index
    @tasks = @project.tasks
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
