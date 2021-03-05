module PostsHelper
  def link_to_previous_post
    @page > 1 ? link_to( "Previous Page", published_posts_path(page: @page - 1)) : "Previous Page"
  end

  def link_to_next_post
    @has_next ? link_to( "Next Page", published_posts_path(page: @page + 1)) : "Next Page"
  end

  def button_publish_post
    # Otherwise created_at attribute is null and application breaks
    unless @post.new_record?
      link_to 'Publish', publish_post_path(@post), class: 'button', method: :patch
    end
  end
end
