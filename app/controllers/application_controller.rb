class ApplicationController < ActionController::Base
  POSTS_PER_PAGE = 4
  def pagination
    @page = params.fetch(:page, 1).to_i # Add page variable for default value and offset usage
    @posts = Post.all.offset((@page - 1) * POSTS_PER_PAGE).limit(POSTS_PER_PAGE) # Add posts display limit and offset starting point
  end
end
