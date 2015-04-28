class AddDeliveryUrlToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :delivery_url, :string
  end
end
