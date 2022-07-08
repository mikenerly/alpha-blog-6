class AddAdminToUsers < ActiveRecord::Migration[5.2]
  def change
    #to add column admin to users table,, type boolean and default value false
    add_column :users, :admin, :boolean, default: false
  end
end
