module ToursHelper
  def link_to_toggle_tour_active(tour)
    @tour = Tour.find(params[:id])
    url = tour_status_path(tour)

    if tour.active?
      link_to_with_icon('icon-star', 'active', url, {
        method: 'PATCH',
        remote: true,
        class: 'active btn btn-primary',
      })
    else
      link_to_with_icon('icon-star', 'active', url, {
        method: 'PATCH',
        remote: true,
        class: 'active btn',
      })
    end
  end

  def link_to_with_icon(icon_css, title, url, options = {})
    icon = content_tag(:i, nil, class: icon_css)
    title_with_icon = icon << ' '.html_safe << h(title)
    link_to(title_with_icon, url, options)
  end
end
