class PagesController < ApplicationController
  def index
    @pinned_articles = Article.pinned.on
    @categories = Category.on.is_main
    @sub_categories = Category.on.is_subject
  end
end
