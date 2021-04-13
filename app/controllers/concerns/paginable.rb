module Paginable
  PER_PAGE = 4

  def paginate(page_params, klass)
    # retun numbers of page
    @pages = (klass.count / PER_PAGE.to_f).ceil
    # ensure params page is a Number
    @page = (page_params || 0).to_i
    klass.offset(PER_PAGE * @page).limit(PER_PAGE)
  end
end
