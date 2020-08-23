class ArticlesController < ApplicationController

  # passing in the method name (set_article) as a symbol to this method (before_action)
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  
  def show
    #byebug    # barhova irjuk a kodban, megszakitja a futast es ad egy debugger console-t (lasd Gemfile leiras)
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    #render plain: params[:article]  #ez is egyfajta debug, igy a bongeszoben jelenik meg az article tartalma
    #@article = Article.new(params.require(:article).permit(:title, :description))
    @article = Article.new(article_params)
    @article.user = User.first
    #render plain: @article.inspect
    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      render 'new'
    end 
    # 'rails routes --expanded' parancs hatasara latjuk, hogy a show route-nal a prefix 'article'
    # ahhoz, hogy ezt hasznalhassuk a kodban, akkor hozza kell rakni a '_path' -t
    #redirect_to article_path(@article)
    # shortcut:
    # redirect_to @article
    # ha az osszes article-t kilistazo oldalra akarjuk iranyitani:
    # redirect_to :articles
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
    # alabbiak nem voltak soha a hivatalos kodban, csak probalkozasok
    #if @article.destroy
    #  flash[:notice] = "Article was deleted successfully"
    #  redirect_to articles_path
    #else
    #  render 'index'
    #end
  end

  # anything below private is a private method
  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

end