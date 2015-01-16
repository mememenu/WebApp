class AddSundayHoursToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :sunday_hours, :string
  end
end
