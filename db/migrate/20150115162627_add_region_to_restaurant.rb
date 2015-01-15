class AddRegionToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :region, :string
  end
end
