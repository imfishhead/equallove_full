class PagesController < ApplicationController
  def index
    @pinned_articles = Article.on.pinned
    @front_page_pinned = Category.on.first(4)
    @categories = Category.on.is_main
    @sub_categories = Category.on.is_subject.where(id: Post.on.pluck(:category_id))
  end
end
