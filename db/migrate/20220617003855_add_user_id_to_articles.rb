class AddUserIdToArticles < ActiveRecord::Migration[5.2]
  def change
    #add column to articles table
    add_column :articles, :user_id, :int
  end
end
