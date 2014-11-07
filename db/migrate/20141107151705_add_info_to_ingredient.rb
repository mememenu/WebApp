class AddInfoToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :description, :text
  end
end
