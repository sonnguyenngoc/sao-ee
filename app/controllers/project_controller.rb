class ProjectController < ApplicationController
  def index
    @lastest_news = Article.get_all_news
    @projects = Article.get_all_projects
  end
  def project_detail
    @lastest_news = Article.get_all_news
    @projects = Article.get_all_projects
    @project = Article.find(params[:article_id])
  end
end
