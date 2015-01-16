class AddWednesdayHoursToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :wednesday_hours, :string
  end
end
