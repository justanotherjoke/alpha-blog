class ArticlesController < ApplicationController
  
  def show
    #byebug    # barhova irjuk a kodban, megszakitja a futast es ad egy debugger console-t (lasd Gemfile leiras)
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    #render plain: params[:article]  #ez is egyfajta debug, igy a bongeszoben jelenik meg az article tartalma
    @article = Article.new(params.require(:article).permit(:title, :description))
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
    @article = Article.find(params[:id])
    if @article.update(params.require(:article).permit(:title, :description))
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

end