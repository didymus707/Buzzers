module CategoriesHelper
  def change_style(article, ind = 0)
    ind -= 1 if ind.odd?
    if ind % 4 == 0
      render partial: 'partials/category/style1', locals: { article: article }
    else
      render partial: 'partials/category/style2', locals: { article: article }
    end
  end
end
