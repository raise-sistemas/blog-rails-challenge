class Post < ApplicationRecord
  # enum to control Post status: 0 -> unpublished, 1 -> published
  enum status: %i[unpublished published]

  validates :title, :body, presence: true

  # return all published posts
  scope :published, -> { where(status: :published) }
end
