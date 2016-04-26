class ArticleListImage < ActiveRecord::Base
  mount_uploader :image_url, ArticleUploader
end
