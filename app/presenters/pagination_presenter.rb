class PaginationPresenter
  def initialize(page, posts)
    @page = page
    @posts = posts
  end

  def previous_pagination_condition
    if @page > 1
      yield
    end
  end

  def next_pagination_condition
    if @posts.count >= 4
      yield
    end
  end
end
