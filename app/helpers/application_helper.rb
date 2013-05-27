module ApplicationHelper

  def nav_link(page, calc_sub_nav=true, &block)
    is_current = current_page?(page.url) ? "current" : "not-current"
    sub_nav = sub_nav_on(page) if calc_sub_nav

    content_tag(:li, class: [is_current, sub_nav]) do
      html = content_tag(:span, "&nbsp;".html_safe,
                         class: ['bullet', is_current, sub_nav])
      html += link_to(page.title, refinery.url_for(page.url))
      html += capture(&block) if block_given?
      html
    end
  end

  def sub_nav_on(page)
    return if page.children.empty?
    on = page.children.any? {|p| current_page?(p.url) }
    if on
      "subnav-on"
    else
      "subnav-off"
    end
  end
end
