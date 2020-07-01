class ArticlesController < ApplicationController
  
  def show
    #byebug    # barhova irjuk a kodban, megszakitja a futast es ad egy debugger console-t (lasd Gemfile leiras)
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

end