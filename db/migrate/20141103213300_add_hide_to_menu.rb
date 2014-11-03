class AddHideToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :hide, :boolean
  end
end
