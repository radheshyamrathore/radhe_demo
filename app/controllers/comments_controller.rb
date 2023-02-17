class CommentsController < ApplicationController
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

  private
    def comment_params
      params.require(:comment).permit(:commenter, :description, :article_id)
    end
end
