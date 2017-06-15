class ArticlesController < ApplicationController
  def show
  	@article = Article.find(params[:id])
  	@category = @article.category.is_main? ? @article.category : @article.category.parent
  end
end
