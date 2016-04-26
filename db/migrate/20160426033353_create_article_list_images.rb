class CreateArticleListImages < ActiveRecord::Migration
  def change
    create_table :article_list_images do |t|
      t.integer :article_id
      t.string :image_url

      t.timestamps null: false
    end
  end
end
