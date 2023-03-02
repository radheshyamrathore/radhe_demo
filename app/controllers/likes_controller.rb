class LikesController < ApplicationController
   before_action :set_article, only: [:create, :destroy]
   before_action :find_post, only: [:destroy, :create]

  def index
    @likes = Like.all
  end

  def new
    @like =  Like.new
  end

  def create
    if already_liked?
      flash[:notice] = "Already liked"
    else
      @post.likes.create(user_id: current_user.id)
    end
    redirect_to article_post_path(@article, @post)
  end

  def destroy
    @like = @post.likes.find(params[:id])
    if !(already_liked?)
      flash[:notice] = "Already unliked "
    else
      @like.destroy
    end
    redirect_to article_post_path(@article, @post)
  end

  def already_liked?
    Like.where(user_id: current_user.id, post_id:
    params[:post_id]).exists?
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end