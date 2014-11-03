class RemoveCategoryFromDish < ActiveRecord::Migration
  def change
    remove_column :dishes, :category, :string
    remove_column :dishes, :category_display, :string
  end
end
