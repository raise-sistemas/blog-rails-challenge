class Post < ApplicationRecord
  validates :title, :body, presence: true

  # Replaces special characters in a string so that it may be used as part of a 'pretty' URL.
  def to_param
    [id, title.parameterize, created_at.day, id].join('-')
  end
end
