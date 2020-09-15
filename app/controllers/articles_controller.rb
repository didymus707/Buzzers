class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy like unlike]
  impressionist action: [:show], unique: %i[impressionable_type impressionable_id session_hash]

  def index
    @articles = Article.includes(:comments)
    @featured_article = Article.unscoped.order(cached_votes_score: :desc).limit(1)
    @article = @featured_article.last
  end

  def show
    @article = Article.includes(:comments).find(params[:id])
    @comments = @article.comments
  end

  def new
    @article = current_user.articles.build
    @categories = Category.ordered_by_priority
  end

  def edit; end

  def create
    @article = current_user.articles.build(article_params)
    @categories = Category.ordered_by_priority

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like
    @article = Article.find(params[:id])
    @article.liked_by current_user

    respond_to do |format|
      format.html { redirect_back fallback_location: category_path }
    end
  end

  def unlike
    @article = Article.find(params[:id])
    @article.unliked_by current_user
    respond_to do |format|
      format.html { redirect_back fallback_location: category_path }
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :image, category_ids: [], categories_attributes: %i[name priority])
  end
end
