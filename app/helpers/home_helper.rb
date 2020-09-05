module HomeHelper
  def featured_article(article)
    render partial: 'partials/featured' if article.present?
  end
end
