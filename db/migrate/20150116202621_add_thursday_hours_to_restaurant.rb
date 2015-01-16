class AddThursdayHoursToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :thursday_hours, :string
  end
end
