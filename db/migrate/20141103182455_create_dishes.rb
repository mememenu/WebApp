class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :category_display
      t.string :portion_size
      t.integer :spice
      t.boolean :hot
      t.boolean :gluten_free
      t.boolean :vegetarian
      t.references :menu, index: true

      t.timestamps
    end
  end
end
