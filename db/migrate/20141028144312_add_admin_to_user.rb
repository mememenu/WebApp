class AddAdminToUser < ActiveRecord::Migration
  def change
    add_column :users, :admin, :boolean
    add_column :users, :restaurant, :boolean
  end
end
