class PostsController < ApplicationController
  before_action :set_article, only: [:show, :create, :update, :destroy, :index]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = @article.posts.create(post_params.merge(user_id: current_user.id))
    redirect_to article_post_path(@article, @post)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = @article.posts.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to article_post_path(@post.article, @post)
    else
      render :edit
    end
  end

  def destroy
    @post = @article.posts.find_by(id: params[:id])
    if @post.destroy
      redirect_to root_path
    end
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :article_id, :user_id)
  end
end
