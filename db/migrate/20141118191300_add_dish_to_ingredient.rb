class AddDishToIngredient < ActiveRecord::Migration
  def change
    add_reference :ingredients, :dish, index: true
  end
end
