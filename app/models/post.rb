class Post < ApplicationRecord
  # enum to control Post status: 0 -> unpublished, 1 -> published
  enum status: %i[unpublished published]

  validates :title, :body, presence: true

  # return all published posts
  scope :published, -> { where(status: :published) }

  # this method change state of post to published
  def publish
    self.status = :published
    self.published_at = DateTime.current
  end
end
