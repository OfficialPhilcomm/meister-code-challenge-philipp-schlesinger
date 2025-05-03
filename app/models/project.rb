class Project < ApplicationRecord
  validates :name, presence: true

  has_many :tasks

  scope :not_deleted, ->() { where(deleted_at: nil) }
end
