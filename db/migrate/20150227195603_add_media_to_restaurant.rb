class AddMediaToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :facebook, :string
    add_column :restaurants, :twitter, :string
    add_column :restaurants, :instagram, :string
  end
end
