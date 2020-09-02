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
      render partial: 'partials/articles/like_article'
    end
  end


end
