class CommentsController < ApplicationController
  before_action :set_article, on: [:edit, :show, :index, :update]
  def index
    @comments =  @article.comments
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id] 
    if @comment.save
      redirect_to article_comments_path(article_id:@comment.article_id)
    else
      render new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.article_id = params[:article_id]
    if @comment.destroy
    redirect_to root_path
  end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @comment
    else
      render :edit
    end
  end

  def update
    @user = User.find(params[:user_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to comment_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private

  def set_article
    @article = Article.find(params[:article_id])
  end

    def comment_params
      params.require(:comment).permit(:commenter, :description, :article_id, :user_id)
    end
end
