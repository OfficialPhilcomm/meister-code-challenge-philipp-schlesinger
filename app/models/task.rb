class Task < ApplicationRecord
  belongs_to :project
  belongs_to :task, optional: true

  has_many :task_dependencies, class_name: "TaskDependency"
  has_many :dependent_on, class_name: "Task", through: :task_dependencies

  validates :name, presence: true

  scope :not_deleted, ->() { where(deleted_at: nil) }
  scope :not_expired, ->() { where(expired_at: nil) }
end
