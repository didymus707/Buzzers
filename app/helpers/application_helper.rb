module ApplicationHelper
  def active_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'links hom' : 'links'

    content_tag(:li, class: class_name) do
      link_to link_text, link_path
    end
  end

  def not_user_n_friends_with(user, link_text2, *link_text1)
    return if user.name == current_user.name
    return unless current_user.viable_friend?(user)

    if current_page?(user_path(user))
      render partial: 'partials/for_show', locals: { user: user, link_text1: link_text1, link_text2: link_text2 }
    else
      render partial: 'partials/other_users', locals: { user: user, link_text1: link_text1, link_text2: link_text2 }
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

  # articles_show
  def comments_form
    if logged_in?
      render partial: 'comments/form'
    else
      render partial: 'partials/articles/comment_signup'
    end
  end

  # articles_index

  # category_show

  # home_index
end
