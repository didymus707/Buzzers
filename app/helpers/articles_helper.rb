module ArticlesHelper
  # article_show
  def comments_form
    if logged_in?
      render partial: 'comments/form'
    else
      render partial: 'partials/articles/comment_signup'
    end
  end

  # article index
  def like_unlike(article)
    if logged_in?
      if current_user.liked?(article)
        render partial: 'partials/articles/unlike_article', locals: { article: article }
      else
        render partial: 'partials/articles/like_article', locals: { article: article }
      end
    else
      render partial: 'partials/articles/like_article', locals: { article: article }
    end
  end

  # hide fcategory form
  def hide_form(cat, foo)
    class_name = cat.size == 4 ? 'field dnone' : 'field'
    content_tag(:div, class: class_name) do
      render partial: 'partials/category/new_category', locals: { foo: foo }
    end
  end
end
