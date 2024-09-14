module ApplicationHelper
  include Pagy::Frontend

  def nav_tab(title:, url:, options: {})
    current_page = options.delete(:current_page)
    css_class = current_page == title ? 'text-secondary' : 'text-white'
    if options[:class].present?
      options[:class] += " #{css_class}"
    else
      options[:class] = css_class
    end
    link_to title, url, options
  end

  def currently_at(current_page = '')
    render partial: 'shared/menu', locals: {current_page: current_page}
  end

  def full_title(title = '')
    base_title = "RailsAppByGuide"
    if title.present?
      "#{title} | #{base_title}"
    else
      base_title
    end
  end
end
