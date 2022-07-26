class CreateArticleCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :article_categories do |t|
      #add the two fields it id of article and category tables
      t.integer :article_id
      t.integer :category_id
      
      #and after run the db file with cmd "rails db:migrate"
    end
  end
end
