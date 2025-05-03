class TasksController < ApplicationController
  before_action :find_project, only: [ :index ]

  def index
    @tasks = @project.tasks
  end

  private

  def find_project
    @project = Project.find(params[:project_id])
  end
end
