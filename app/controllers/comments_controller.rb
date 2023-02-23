class CommentsController < ApplicationController
  before_action :set_article, only: [:create, :update, :destroy]
  before_action :set_post, only: [:destroy, :create]

  def index
    @comments =  Comment.all
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save 
      redirect_to article_post_path(@article, @post)
    else
      render :new
    end
  end
 
  def destroy
    @comment = @post.comments.find_by(id: params[:id])
    if @comment.destroy
      redirect_to article_post_path(@article, @post)
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :description, :article_id, :user_id, :post_id)
  end
end
