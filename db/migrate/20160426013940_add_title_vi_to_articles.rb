class AddTitleViToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :title_vi, :string
  end
end
