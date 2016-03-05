class ArticleController < ApplicationController
  def home
    @article = Article.all
  end

  def view
    @article = Article.find_by id: params[:id]
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new params.require(:article).permit(:title, :body)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @article = Article.find params[:id]
  end

  def update
    @article = Article.find params[:id]
    if @article.update params.require(:article).permit(:title, :body)
      redirect_to root_path
    else
      render :edit
    end
  end

def delete
    @article = Article.find params[:id]
    @article.destroy
    redirect_to root_path
  end

end
