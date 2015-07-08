class AddOwnerIdToRestaurant < ActiveRecord::Migration
  def self.up
    add_column :restaurants, :owner_id, :integer
    add_index :restaurants, :owner_id
    remove_column :users, :restaurant_id
  end

  def self.down
    add_column :users, :restaurant_id, :integer
    add_index :users, :restaurant_id
    remove_column :restaurants, :owner_id
  end
end
