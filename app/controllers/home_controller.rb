class HomeController < ApplicationController
  def index
    @title_head = "Trang chủ"
    @lastest_blog_posts = Article.get_lastest_blog_posts
    @slides = Article.get_all_slides
  end
end
