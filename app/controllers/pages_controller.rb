class PagesController < ApplicationController
  def index
    @pinned_articles = Article.on.pinned
    @front_page_pinned_newest = Category.where("title LIKE ?", "%最新%").first
    @front_page_pinned_news = Category.where("title LIKE ?", "%新聞%").first
    @front_page_pinned_rumors = Category.where("title LIKE ?", "%闢謠%").first
    @front_page_pinned_videos = Category.where("title LIKE ?", "%影音%").first
    @categories = Category.on.is_main
    @sub_categories = Category.on.with_posts.is_subject.where(id: Post.on.pluck(:category_id))
  end
end
