module ApplicationHelper
  def previous_page(path)
    link_to('<< Previous --', [path, { page: @page - 1 }.to_query].join('?')) if @page.positive?
  end

  def next_page(path)
    link_to('Next >>', [path, { page: @page + 1 }.to_query].join('?')) if @pages != @page + 1
  end
end
