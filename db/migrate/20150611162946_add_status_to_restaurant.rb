class AddStatusToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :status, :string
  end
end
