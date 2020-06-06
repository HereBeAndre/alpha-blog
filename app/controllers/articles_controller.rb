class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
  end

  def create
    # Debugging hack to see what is received from the form in new.html.erb =>
    # render plain: params[:article]

    @article = Article.new(article_params)
    # Same debugging hack as above
    # render plain: @article.inspect
    @article.save
    redirect_to @article # Shortened for standard line below
    # redirect_to article_path(@article)
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
