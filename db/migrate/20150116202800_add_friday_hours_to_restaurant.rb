class AddFridayHoursToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :friday_hours, :string
  end
end
