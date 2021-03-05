class Post < ApplicationRecord
  validates :title, :body, presence: true

  # Replaces special characters in a string so that it may be used as part of a 'pretty' URL.
  def to_param
    [id, title.parameterize, created_at.day, id].join('-')
  end

  # Order posts by descending created_at column and paginate them by the posts_per_page limit
  def self.order_by_and_paginate(page, posts_per_page)
    order(created_at: :desc)
        .offset((page - 1) * posts_per_page)  # (page - 1) because needs to start in ?page=1 not ?page=0
        .limit(posts_per_page)
  end
end
