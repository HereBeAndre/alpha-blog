class ArticlesController < ApplicationController

  before_action :find_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show; end

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

  def edit; end

  def update
    if @article.update(article_params)
      flash[:notice] = 'Article was updated successfully'
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def find_article
    @article = Article.find(params[:id])
  end

end
