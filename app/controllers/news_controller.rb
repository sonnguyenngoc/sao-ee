class NewsController < ApplicationController
  def index
    @news = Article.get_all_news.paginate(:page => params[:page], :per_page => 4)
    @lastest_news = Article.get_all_news
    @projects = Article.get_all_projects
  end
  def detail
    @news = Article.find(params[:article_id])
    @lastest_news = Article.get_all_news
    @projects = Article.get_all_projects
  end
end
