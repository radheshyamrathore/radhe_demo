class LikesController < ApplicationController
  before_action :set_article, only: [:create, :destroy]
  before_action :set_post, only: [:destroy, :create]

  def index
    @likes = Like.all
  end

  def create
    @like = @post.likes.new(like_params)
    @like.user_id = current_user.id
    if @like.save 
      redirect_to article_post_path(@article, @post)
    else
      render :new
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def like_params
    params.require(:like).permit(:article_id, :user_id, :post_id)
  end
end
