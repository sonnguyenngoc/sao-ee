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
    
    @contact = Contact.new
  end
  def energy_services
    @lastest_news = Article.get_all_news
    @saos = Article.get_saos
  end
  def architecture_services
    
  end
end
