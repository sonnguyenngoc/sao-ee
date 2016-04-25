class ProjectController < ApplicationController
  def index
    @lastest_news = Article.get_all_news
    @projects = Article.get_all_projects
  end
  def detail
    @lastest_news = Article.get_all_news
  end
end
