class Post < ApplicationRecord
  validates :title, :body, presence: true

  # Replaces special characters in a string so that it may be used as part of a 'pretty' URL.
  def to_param
    [id, title.parameterize, created_at.day, id].join('-')
  end

  # Returns published posts, ordered by descending published_at column and paginate them by the posts_per_page limit
  scope :published, ->(page, posts_per_page) {
    where.not(published_at: nil)  # Only published posts
        .order(published_at: :desc) # Ordered by publish date
        .offset((page - 1) * posts_per_page)  # (page - 1) because needs to start in ?page=1 not ?page=0
        .limit(posts_per_page)  # Limiting posts per page
  }

  # Updates publish date
  def publish
    update! published_at: DateTime.now
  end
end
