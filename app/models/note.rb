class Note < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  default_scope { where(deleted_at: nil) }

  belongs_to :user
end
