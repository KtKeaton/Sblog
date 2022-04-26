class Note < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true

  def self.available
    where(deleted_at: nil)
  end
end
