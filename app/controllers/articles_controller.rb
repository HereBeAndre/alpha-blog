class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    # Send empty instance variable to form page in order for flash to work
    @article = Article.new
  end

  def create
    # Debugging hack to see what is received from the form in new.html.erb =>
    # render plain: params[:article]

    @article = Article.new(article_params)
    # Similar debugging hack as above
    # render plain: @article.inspect

    if @article.save
      flash[:notice] = 'Article was successfully created.'
      redirect_to @article # Shortened for standard line below
      # redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

end
