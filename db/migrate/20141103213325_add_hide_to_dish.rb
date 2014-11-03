class AddHideToDish < ActiveRecord::Migration
  def change
    add_column :dishes, :hide, :boolean
  end
end
