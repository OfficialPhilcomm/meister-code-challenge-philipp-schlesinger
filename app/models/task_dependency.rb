class TaskDependency < ApplicationRecord
  belongs_to :task
  belongs_to :dependent_on, class_name: "Task"

  validate :no_circular_dependency

  private

  def no_circular_dependency
    if TaskDependency.find_by(task: dependent_on, dependent_on: task).present?
      errors.add(:task, "circular dependency detected")
    end
  end
end
