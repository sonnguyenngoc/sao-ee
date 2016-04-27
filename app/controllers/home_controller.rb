class HomeController < ApplicationController
  def index
    @title_head = "Trang chủ"
    @lastest_blog_posts = Article.get_lastest_blog_posts
    @slides = Article.get_all_slides
    @lastest_news = Article.get_all_news
    @news = Article.get_all_news
    @intros = Article.get_intro
    @projects = Article.get_all_projects
    @about_us = Article.get_about_us
    @saos = Article.get_saos
    @contact = Contact.new
  end
  def sao
    @lastest_news = Article.get_all_news
  end
end
