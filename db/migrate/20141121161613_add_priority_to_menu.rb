class AddPriorityToMenu < ActiveRecord::Migration
  def change
    add_column :menus, :priority, :integer
  end
end
