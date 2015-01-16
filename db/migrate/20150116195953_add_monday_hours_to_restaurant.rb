class AddMondayHoursToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :monday_hours, :string
  end
end
