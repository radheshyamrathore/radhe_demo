class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result(distinct: true)
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save 
      ArticleEmailJob.set(wait: 1.minute).perform_later(@article, current_user)
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to root_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end
  
  def article_params
    params.require(:article).permit(:title, :description, :user_id, :q)
  end
end
