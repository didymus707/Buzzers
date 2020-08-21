class HomeController < ApplicationController
  def index
    @articles = Article.all.order('created_at desc')
    @featured_article = Article.unscoped.order(cached_weighted_total: :desc).limit(1)
    @article = @featured_article.last
    @categories = Category.all.ordered_by_priority
  end
end
