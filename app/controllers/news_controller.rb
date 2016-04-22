class NewsController < ApplicationController
  def index
    @news = Article.get_all_news
  end
end
