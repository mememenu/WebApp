class RemoveTypeFromCuisine < ActiveRecord::Migration
  def change
    remove_column :cuisines, :type, :string
  end
end
