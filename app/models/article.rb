class Article < ActiveRecord::Base
  mount_uploader :image_url, ArticleUploader
  mount_uploader :image_url_vi, ArticleUploader
  has_and_belongs_to_many :article_categories
  has_and_belongs_to_many :products
  has_many :article_list_images
  accepts_nested_attributes_for :article_list_images, :reject_if => lambda { |a| a[:image_url].blank? and a[:title].blank? and a[:title_vi].blank? }, :allow_destroy => true
  
  def self.get_lastest_blog_posts
    self.order("created_at DESC").first(3)
  end
  
  def self.get_all_blogs
    self.all.order("created_at DESC")
  end
  
  def self.get_blog_about_us
    records = self.joins(:article_categories).where(article_categories: {name: "Về chúng tôi"})
    records.order("created_at").first
    
    return records
  end
  
  ##get artilce
  
    #slider
      def self.get_all_slides
        records = self.all
        records = records.joins(:article_categories).where(article_categories: {name: "Slideshow"})
        records.order("created_at DESC")
        
        return records
      end
    #slider
    
    #projects
      def self.get_all_projects
        records = self.all
        records = records.joins(:article_categories).where(article_categories: {name: "Projects"})
        record = records.order("created_at DESC")
        
        return record
      end
    #projects
    
    #news
      def self.get_all_news
        records = self.all
        records = records.joins(:article_categories).where(article_categories: {name: "News"})
        record = records.order("created_at DESC").first
        
        return record
      end
    #news
    
    #about_us
      def self.get_about_us
        records = self.all
        records = records.joins(:article_categories).where(article_categories: {name: "About Us"})
        record = records.order("created_at DESC").first
        
        return record
      end
    #about_us
    
    #intro
      def self.get_intro
        records = self.all
        records = records.joins(:article_categories).where(article_categories: {name: "Intro"})
        record = records.order("created_at DESC").first
        
        return record
      end
    #intro
    
    #s-a-o
      def self.get_saos
        records = self.all
        records = records.joins(:article_categories).where(article_categories: {name: "S-A-O"})
        records = records.order("created_at ASC")
        
        return records
      end
    #intro
  
  ##get article
  
  def get_related_blogs
    cat_ids = []
    article_categories.each do |c|
      cat_ids += c.get_all_related_ids
    end
    records = Article.joins(:article_categories).where(article_categories: {id: cat_ids}).uniq
    
    return records
  end
  
  def self.sort_by
    [
      ["Created At","created_at"]
    ]
  end
  
  def self.sort_orders
    [
      ["DESC","desc"],
      ["ASC","asc"],
    ]
  end
  
  #Filter, Sort
  def self.search(params)
    records = self.all
    
    #Category filter
    if params[:article_category_id].present?
        records = records.joins(:article_categories).where(article_categories: {id: params[:article_category_id]})
    end

    #Search keyword filter
    if params[:keyword].present?
        records = records.where("LOWER(articles.title) LIKE ?", "%#{params[:keyword].downcase.strip}%")
    end
    
    # for sorting
    sort_by = params[:sort_by].present? ? params[:sort_by] : "articles.created_at"
    sort_order = params[:sort_order].present? ? params[:sort_order] : "asc"
    records = records.order("#{sort_by} #{sort_order}")
    
    return records   
  end
  
  def display_title(lang)
    lang == 'vi' ? title_vi : title
  end
  
  def display_content(lang)
    lang == 'vi' ? content_vi : content
  end
  
end
