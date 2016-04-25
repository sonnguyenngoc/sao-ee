class ContactController < ApplicationController
  def index
    @lastest_news = Article.get_all_news
  end
end
