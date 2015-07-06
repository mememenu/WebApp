class RemoveHoursFromRestaurant < ActiveRecord::Migration
  def change
    change_table(:restaurants) do |t|
      t.remove :monday_hours
      t.remove :tuesday_hours
      t.remove :wednesday_hours
      t.remove :thursday_hours
      t.remove :friday_hours
      t.remove :saturday_hours
      t.remove :sunday_hours
    end
  end
end
