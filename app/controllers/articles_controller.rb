class ArticlesController < ApplicationController
  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      flash[:notice] = 'article successfully saved!'
      redirect_to article_path (@article)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update

    if @article.update (article_params)
      flash[:notice] = "Update successful"
      redirect_to article_path
    else
      render 'edit'
    end
  end

  def destroy

    if @article.destroy
      flash[:notice] = "article successfully deleted"
      redirect_to articles_path
    else
      render 'index'
    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title,:description)
  end
end


