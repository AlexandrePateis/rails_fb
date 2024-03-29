class ArticlesController < ApplicationController
  
  load_and_authorize_resource
  before_action :authenticate_user!, except: %i[index show]

  def index
    @q = Article.ransack(params[:q])
    @articles = @q.result.includes(:comments).page(params[:page])
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = current_user.articles.new
  end

  def create
    @article = current_user.articles.new(article_params)
    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit    
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])    
    if @article.update(article_params)
      redirect_to @article
    else            
      render :edit, status: :unprocessable_entity
    end
  end

def destroy
  @article = Article.find(params[:id])
  @article.destroy

  redirect_to root_path, status: :see_other
end

  private
    def article_params
      params.require(:article).permit(:title, :body, :status, :file, comments_attributes: [:id, :_destroy, :body, :status, :user_id] )
    end
end
