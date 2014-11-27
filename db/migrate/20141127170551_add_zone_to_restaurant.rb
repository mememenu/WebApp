class AddZoneToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :zone, :string
  end
end
