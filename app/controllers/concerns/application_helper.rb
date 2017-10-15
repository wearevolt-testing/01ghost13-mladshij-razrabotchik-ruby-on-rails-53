module ApplicationHelper
  # Title for pages
  def full_title(page_title = '')
    base_title = 'Volt_project'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end
end
