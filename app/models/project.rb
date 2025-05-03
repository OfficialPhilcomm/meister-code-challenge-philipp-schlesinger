class Project < ApplicationRecord
  validates :name, presence: true

  scope :not_deleted, ->() { where(deleted_at: nil) }
end
