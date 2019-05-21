class PagesController < ApplicationController
  def index
    @pinned_articles = Article.on.pinned
    @category_newest = Category.where("title LIKE ?", "%最新%").first
    @pinned_newest = @category_newest.articles.on.front_page_pinned.first
    @category_news = Category.where("title LIKE ?", "%新聞%").first
    @pinned_news = @category_news.articles.on.front_page_pinned.first
    @category_rumor = Category.where("title LIKE ?", "%闢謠%").first
    @pinned_rumor = @category_rumor.articles.on.front_page_pinned.first
    @category_video = Category.where("title LIKE ?", "%影音%").first
    @pinned_video = @category_video.videos.on.front_page_pinned.first
    @categories = Category.on.is_main
    @sub_categories = Category.where(id: Category.on.with_posts.is_subject)
  end

  def about
  end
end
