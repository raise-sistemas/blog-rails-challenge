class Post < ApplicationRecord
  scope :published, -> { where.not(published_at: nil) }
  validates :title, :body, presence: true
end
