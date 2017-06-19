class ArticlesController < ApplicationController
  def show
  	@article = Article.find(params[:id])
  	@category = @article.category.is_main? ? @article.category : @article.category.parent

  	redirect_to category_path(@category) unless @article.on?

  	render layout: "post"
  end
end
