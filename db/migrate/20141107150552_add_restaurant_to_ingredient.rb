class AddRestaurantToIngredient < ActiveRecord::Migration
  def change
    add_reference :ingredients, :restaurant, index: true
  end
end
