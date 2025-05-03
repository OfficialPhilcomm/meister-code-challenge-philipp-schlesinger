class Task < ApplicationRecord
  belongs_to :project
  belongs_to :task, optional: true

  validates :name, presence: true
end
