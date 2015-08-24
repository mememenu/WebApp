class AddPriceToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :price, :integer
  end
end
