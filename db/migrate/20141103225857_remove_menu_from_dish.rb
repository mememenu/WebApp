class RemoveMenuFromDish < ActiveRecord::Migration
  def change
    remove_reference :dishes, :menu, index: true
  end
end
