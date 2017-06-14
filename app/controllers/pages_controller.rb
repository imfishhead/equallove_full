class PagesController < ApplicationController
  def index
    @pinned_articles = Article.pinned
  end
end
