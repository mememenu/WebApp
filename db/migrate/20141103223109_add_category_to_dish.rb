class AddCategoryToDish < ActiveRecord::Migration
  def change
    add_reference :dishes, :category, index: true
  end
end
