class RemoveDisplayFromMenu < ActiveRecord::Migration
  def change
    remove_column :menus, :display_name, :string
  end
end
