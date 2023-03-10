class PostsController < ApplicationController
  before_action :set_article, only: [:show, :create, :update, :destroy, :index]

  def index
    if params[:search]
      @posts = Post.where('title Like ?', "%#{params[:search]}")
    else 
    @posts = Post.all
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = @article.posts.new(post_params)
    @post.user_id = current_user.id
    if @post.save 
      redirect_to article_post_path(@article, @post)
    else
      render :new, status: :unprocessable_entity
    end
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
    params.require(:post).permit(:title, :description, :article_id, :user_id, :search)
  end
end
