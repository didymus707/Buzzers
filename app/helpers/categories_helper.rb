module CategoriesHelper
  def change_style(article, i = 0)
    i = 0 if i == 4
    if i <= 1
      return render partial: 'partials/category/style1', locals: { article: article }
      i += 1
    elsif i > 1
      return render partial: 'partials/category/style2', locals: { article: article }
      i += 1
    end
  end
end
