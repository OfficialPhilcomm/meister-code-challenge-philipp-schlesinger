class Task < ApplicationRecord
  belongs_to :project
  belongs_to :task, optional: true

  validates :name, presence: true

  scope :not_deleted, ->() { where(deleted_at: nil) }
end
