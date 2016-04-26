class AddContentViToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :content_vi, :text
  end
end
