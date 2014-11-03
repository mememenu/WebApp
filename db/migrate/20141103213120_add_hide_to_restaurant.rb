class AddHideToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :hide, :boolean
  end
end
