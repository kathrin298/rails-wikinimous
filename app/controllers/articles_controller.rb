class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :update, :edit, :destroy]

  def index
    @articles = Article.all
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    Article.create(user_params)
    redirect_to articles_path
  end

  def edit; end

  def update
    @article.update(user_params)
    redirect_to article_path(params[:id])
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def user_params
    params.require(:article).permit(:title, :content)
  end

  def find_article
    @article = Article.find(params[:id])
  end
end
