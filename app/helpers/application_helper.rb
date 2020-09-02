module ApplicationHelper
  def active_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'links hom' : 'links'

    content_tag(:li, class: class_name) do
      link_to link_text, link_path
    end
  end

  # application.html
  def new_art_session
    if logged_in?
      render partial: 'partials/layout/new_art_logout'
    else
      render partial: 'partials/layout/login_register'
    end
  end
end
