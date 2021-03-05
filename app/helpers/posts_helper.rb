module PostsHelper
  def link_to_previous_post
    @page > 1 ? link_to( "Previous Page", published_posts_path(page: @page - 1)) : "Previous Page"
  end

  def link_to_next_post
    @has_next ? link_to( "Next Page", published_posts_path(page: @page + 1)) : "Next Page"
  end
end
