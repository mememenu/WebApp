class DropCuisines < ActiveRecord::Migration
  def change
    drop_table :cuisines
  end
end
