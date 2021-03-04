class ApplicationController < ActionController::Base
  def paginate(model)
    @page = params[:page] ? params[:page].to_i : 1
    @have_next = model.paginate(page: @page  + 1).any?
  end
end
