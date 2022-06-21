class AddPasswordDigestUsers < ActiveRecord::Migration[5.2]
  def change
    #for adding the field to database
    add_column :users, :password_digest, :string
  end
end
