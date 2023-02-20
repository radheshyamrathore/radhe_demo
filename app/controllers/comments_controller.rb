class CommentsController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy, :create]

  def index
    @comments =  Comment.all
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
    @comment = @article.comments.create(comment_params.merge(user_id: current_user.id))
    redirect_to @article
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
    @comment.article_id = params[:article_id]
    if @comment.update(comment_params)
      redirect_to comment_path
    else
      render :edit
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
