class AddImageUrlViToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :image_url_vi, :string
  end
end
