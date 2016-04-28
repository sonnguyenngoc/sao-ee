class ArticleListImage < ActiveRecord::Base
  mount_uploader :image_url, ArticleUploader
  
  def display_title(lang)
    lang == 'vi' ? title_vi : title
  end
end
