class AddSaturdayHoursToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :saturday_hours, :string
  end
end
