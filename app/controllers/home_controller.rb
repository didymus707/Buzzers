class HomeController < ApplicationController
  def index
    @featured_article = Article.unscoped.order(cached_weighted_total: :desc).limit(1)
    @article = @featured_article.last
    @categories = Category.ordered_by_priority.includes(:articles)
  end
end
