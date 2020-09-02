module CategoriesHelper
  def change_style(article, ind = 0)
    ind = 0 if ind == 4
    if ind <= 1
      render partial: 'partials/category/style1', locals: { article: article }
    elsif ind > 1
      render partial: 'partials/category/style2', locals: { article: article }
    end
  end
end
