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
    @like = @post.likes.new
    @like.user_id = current_user.id
    if @like.save 
      redirect_to article_post_path(@article, @post)
    else
      render :new
    end
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