class AddTitleToArticleListImages < ActiveRecord::Migration
  def change
    add_column :article_list_images, :title, :string
  end
end
