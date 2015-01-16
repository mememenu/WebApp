class AddTuesdayHoursToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :tuesday_hours, :string
  end
end
