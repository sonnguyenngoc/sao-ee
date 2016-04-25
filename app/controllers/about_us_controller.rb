class AboutUsController < ApplicationController
  def index
    @about_us = Article.get_about_us
    @lastest_news = Article.get_all_news
  end
end
