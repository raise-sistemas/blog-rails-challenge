module Pagination
  extend ActiveSupport::Concern

  included do
    POSTS_PER_PAGE = 4
  end

  class_methods do
    def post_pagination(page)
      Post.all.offset((page - 1) * POSTS_PER_PAGE).limit(POSTS_PER_PAGE) # Add posts display limit and offset starting point
    end
  end
end
