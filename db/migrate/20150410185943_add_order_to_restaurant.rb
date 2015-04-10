class AddOrderToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :clean_name, :string
  end
end
