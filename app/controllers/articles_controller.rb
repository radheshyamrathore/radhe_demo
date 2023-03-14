class ArticlesController < ApplicationController
  require 'csv'
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  def import
    file = params[:file]
    return redirect_to articles_path, notice: "only csv file please" unless params[:file].content_type == "text/csv"

    filtered = []
    CSV.foreach(file, :headers => true) do |row|
      filtered << row
    end
  end

  def index
    @articles = Article.all
  end

  # def index
  #   @q = Article.ransack(params[:q])
  #   @articles = @q.result(distinct: true)
  # end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save 
      byebug
      ArticleMailer.welcome_article(@article, current_user).deliver_now
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
