module PostsHelper
  def previous_pagination_condition(page)
    if page > 1
      link_to "Previous Page", root_path(page: page - 1), class: "button"
    end
  end

  def next_pagination_condition(page, posts)
    if posts.count >= 4
      link_to "Next Page", root_path(page: page + 1), class: "button"
    end
  end
end
