class AddMapsUrlToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :maps_url, :string
  end
end
