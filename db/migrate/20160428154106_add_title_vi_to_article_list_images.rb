class AddTitleViToArticleListImages < ActiveRecord::Migration
  def change
    add_column :article_list_images, :title_vi, :string
  end
end
